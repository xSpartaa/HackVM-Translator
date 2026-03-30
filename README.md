# HackVM Translator

[![GitHub License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)]()

## 📝 Description
Ce projet est un traducteur de Machine Virtuelle (VM) vers Assembleur, conçu pour l'architecture **Hack**. Il s'inscrit dans le cadre de la construction d'un système informatique complet (approche *Nand to Tetris*).

Le traducteur convertit les fichiers de code intermédiaire `.vm` (basés sur une pile) en fichiers de code assembleur `.asm` exécutables sur le simulateur matériel Hack.

## 🚀 Fonctionnalités
Le traducteur prend en charge l'ensemble du jeu d'instructions VM :
- **Opérations Arithmétiques & Logiques** : `add`, `sub`, `neg`, `eq`, `gt`, `lt`, `and`, `or`, `not`.
- **Accès Mémoire** : Gestion des segments `local`, `argument`, `this`, `that`, `constant`, `static`, `temp` et `pointer`.
- **Contrôle de Flux** : Gestion des labels, des sauts (`goto`) et des sauts conditionnels (`if-goto`).
- **Appels de Fonctions** : Gestion de la pile d'appel, commandes `function`, `call` et `return`.

## 🛠️ Installation et Usage

### Prérequis
- [Indique ici le langage utilisé, ex: Java 11+, Python 3.x, etc.]
- Un émulateur CPU Hack (pour tester le code produit).

### Utilisation
Pour traduire un fichier ou un dossier complet :
```bash
./VMTranslator source/nom_du_fichier.vm
# ou
./VMTranslator source/chemin_du_dossier/
