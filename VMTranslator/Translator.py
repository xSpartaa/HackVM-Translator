"""Translator permet de passer d'un fichier et le traduire en language assembleur dans un autre fichier en utilisant ce qui est fait par Generator.py"""
import os
import glob
import sys

import Generator


class Translator:
    """Initialise la classe Translator"""

    def __init__(self, files, asm):
        self.asm = open(asm, "w")
        self.files = files

    def translate(self):
        """Permet de traduire, si c'est un fichier il appelera translateonefile, si c'est un dossier il fera un appel a translateonfile pour chacun des fichier"""
        self.asm.write(self._bootstrap())
        # os.listdir("/home/olivier")
        if os.path.isfile(self.files):
            self._translateonefile(self.files)
        else:
            if os.path.isdir(self.files):
                for file in glob.glob(f'{self.files}/*.vm'):
                    self._translateonefile(file)

    def _translateonefile(self, file):
        """Traduit un fichier en assembleur dans un autre lorsqu'il est appelé"""
        self.asm.write(f"""\n//code de {file}\n""")
        generator = Generator.Generator(file)
        for command in generator:
            self.asm.write(command)

    def _bootstrap(self):
        """Crée le code du bootstrap qui est par défaut celle retourné et l'initialise a l'aide de Generator.py"""
        init = Generator.Generator()._commandcall({'type': 'Call', 'function': 'Sys.init', 'parameter': '0'})

        return f"""// Bootstrap
    @256
    D=A
    @SP
    M=D
{init}
"""


if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: Translotor.py <vm file| dir> <asm file>")
    else:
        vmfiles=sys.argv[1]
        asmfile=sys.argv[2]
        translator = Translator(vmfiles,asmfile)
        translator.translate()
