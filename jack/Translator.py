"""
Cette classe permet de traduire des fichiers Jack en utilisant la classe Generator.
Elle peut gérer un fichier unique ou tous les fichiers dans un répertoire donné.
"""
import os
import glob
import sys
import Generator


class Translator:
    """
    Initialise le traducteur avec un fichier ou un répertoire.
    :param files: Chemin vers un fichier Jack ou un répertoire contenant des fichiers Jack.
    """

    def __init__(self, files):
        self.files = files

    def translate(self):
        """
        Lance la traduction. Si le chemin correspond à un fichier, il est traduit directement.
        Si le chemin correspond à un répertoire, tous les fichiers .jack qu'il contient sont traduits.
        """

        if os.path.isfile(self.files):
            self._translateonefile(self.files)
        else:
            if os.path.isdir(self.files):
                for file in glob.glob(f'{self.files}/*.jack'):
                    self._translateonefile(file)

    def _translateonefile(self, file):
        """
        Traduit un fichier Jack donné.
        :param file: Chemin vers le fichier Jack à traduire.
        """
        generator = Generator.Generator(file)
        generator.jackclass()


if __name__ == "__main__":
    if len(sys.argv) < 1:
        print("Usage: Translator.py <jack file| dir>")
    else:
        jackfiles = sys.argv[1]
        translator = Translator(jackfiles)
        translator.translate()
