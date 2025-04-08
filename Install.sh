#!/bin/bash

# Fonction pour vérifier si un paquet est installé
is_installed() {
    dpkg -l "$1" | grep -q "^ii" 2>/dev/null
}


############################ POUR METRE A JOUR LES PAQUET
sudo apt-get update

############################ PARTIE VSCODE :
# SERT A : Editer du code et utilise des extension

if is_installed curl; then
    echo "curl est déjà installé."
else
    sudo apt-get install -y curl
fi

if [ -f /etc/apt/trusted.gpg.d/packages.microsoft.gpg ]; then
    echo "La clé de signature Microsoft GPG est déjà installée."
else
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
    sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
fi

if [ -f /etc/apt/sources.list.d/vscode.list ]; then
    echo "Le dépôt Microsoft est déjà ajouté."
else
    sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
fi

if is_installed apt-transport-https; then
    echo "apt-transport-https est déjà installé."
else
    sudo apt-get install -y apt-transport-https
fi

# Installation de Vscode
if is_installed code; then
    echo "Visual Studio Code est déjà installé."
else
    sudo apt-get update
    sudo apt-get install -y code
    if ! is_installed code; then
        echo "L'installation de Visual Studio Code a échoué."
    fi
fi

############################ PARTIE VIM :
# SERT A : Editer du code, texte.
if is_installed vim; then
    echo "Vim est déjà installé."
else
    sudo apt-get install -y vim
fi

############################ PARTIE GIT :
# SERT A : 
# envoyer mon travail sur 
# github et reucpere mon taff de
# nimporte ou + gerer mes travaux 
# en local avec git.

#if is_installed git; then
#    echo "Git est déjà installé."
#else
#    sudo apt-get install -y git
#fi

############################ PARTIE OW MY ZSH :
# source : https://ohmyz.sh/
# SERT A : 
# Pimpé mon terminal + me 
# facilité la vie.
if is_installed zsh; then
    echo "Zsh est déjà installé."
else
    sudo apt-get install -y zsh
fi

# Installation de oh-my-zsh -> Pour que le terminal soit plus beau
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh-My-Zsh est déjà installé."
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

############################ PARTIE Discorde:
# SERT A : Mon pricipal resaux 
# de comunication sur PC
if is_installed discord; then
    echo "Discord est déjà installé."
else
    wget -O ~/discord.deb "https://discord.com/api/download?platform=linux&format=deb"
    sudo dpkg -i ~/discord.deb
    sudo apt-get install -f -y
fi

############################ PARTIE LLDB:
# SERT A : Debeuguer du code TRES UTILE.
if is_installed lldb; then
    echo "LLDB est déjà installé."
else
    sudo apt-get install -y lldb
fi

############################ PARTIE Valgrind:
# SERT A : Debeuguer du code TRES UTILE.
# Verifie les leak de memoire.
if is_installed valgrind; then
    echo "Valgrind est déjà installé."
else
    sudo apt-get install -y valgrind
fi
############################ PARTIE Python:
# Langage de programation utilité : Haut niveau et Langage orientée objet
# Vérifier si Python est installé
if ! command -v python &> /dev/null
then
    # Si Python n'est pas installé, l'installer
    sudo apt-get update
    sudo apt-get install python3
    sudo apt-get install python3-pip
    python3 -m pip install --upgrade pip setuptools
    echo "WARNING!! Metre a la fin de zsh ou bash : export PATH="\$PATH:/home/yatsu/.local/bin""
else
    # Si Python est déjà installé, afficher un message
    echo "Python est déjà installé sur ce système."
fi

############################ PARTIE FIGMA :
# SERT A :
# Editer et concevoir des interfaces graphiques.
# Installer depuis le web pas trouver de ligne de commande.

############################ PARTIE FIGMA :
# SERT A :
# Prendre des notes etc
# Installer depuis le web pas trouver de ligne de commande.

echo "Installe Notion et Figma Manuellement"

sudo bash config_git.sh
