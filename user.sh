#!/usr/bin/bash

source ./.env

echo -e "export GIT_USERNAME=$GIT_USERNAME" >> ~/.bashrc
echo -e "export GIT_EMAIL=$GIT_EMAIL" >> ~/.bashrc
source ~/.bashrc

git config --add --global user.name "$GIT_USERNAME"
git config --add --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main

gh auth login
git clone "https://github.com/$GIT_USERNAME/nvim" ~/.config/nvim

