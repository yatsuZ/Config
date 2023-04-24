#!/bin/bash

echo "Entrez votre nom d'utilisateur Git :"
username="yatsuZ"
echo "$username"

echo "Entrez votre adresse e-mail Git :"
read email


echo "La configuration de Git est terminée !"
echo "Pour pouvoir push depuis se pc je dois generer un token:"

echo "1. Accédez à votre page "Paramètres" sur GitHub. -> https://github.com/settings/profile"
echo ""
echo "2. Dans le menu de gauche, cliquez sur "Developer settings" -> https://github.com/settings/apps"
echo ""
echo "3. Dans le menu de gauche, cliquez sur "Personal access tokens" -> https://github.com/settings/tokens ."
echo ""
echo "4. Cliquez sur le bouton "Generate new token"."
echo ""
echo "5. Donnez un nom à votre token et sélectionnez les autorisations dont vous avez besoin (par exemple, "repo" pour accéder aux référentiels)."
echo ""
echo "6. Cliquez sur le bouton "Generate token". "
echo ""
echo "7. Copiez le token d'accès personnel généré."
echo ""
echo "8. COLLE LE : " 
read token

sudo git config --global credential.helper store
sudo git config --global user.name "$username"
sudo git config --global user.email "$email"
sudo git config --global init.defaultBranch "main"
sudo git config --global user.password "$token"