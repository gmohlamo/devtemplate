#!/usr/bin/env bash
mv nvim ~/.config/nvim # Move this to my normal dotfiles
# install jdtls
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install jdtls
wget https://download.java.net/java/GA/jdk22.0.2/c9ecb94cd31b495da20a27d4581645e8/9/GPL/openjdk-22.0.2_linux-x64_bin.tar.gz -O openjdk-22.tar.gz
tar -xzvf openjdk-22.tar.gz --directory=openjdk
mkdir ~/.local/openjdk && mv openjdk/* ~/.local/openjdk/
tar -xzvf openjdk-22.tar.gz
mv jdk-22.0.2 ~/jdk

echo 'export PATH="$PATH:$HOME/jdk/bin"' >> ~/.bashrc
