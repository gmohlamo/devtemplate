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

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash && source ~/.nvm/nvm.sh && nvm install --lts
# build and install python
cd /tmp/
wget https://www.python.org/ftp/python/3.13.0/Python-3.13.0.tgz
tar xzf Python-3.13.0.tgz
cd Python-3.13.0

sudo ./configure --prefix=/opt/python/3.13.0/ --enable-optimizations --with-lto --with-computed-gotos --with-system-ffi
sudo make -j "$(nproc)"
sudo make altinstall
sudo rm /tmp/Python-3.13.0.tgz
# install pip
python3 -m ensurepip --upgrade
python3 -m pip install --user pipx
python3 -m pipx ensurepath
python3 -m pip install --user --upgrade pynvim
# this should give us the python provider



# install NvChad
nvim --headless "+Lazy! update" +qa && nvim --headless +MasonInstallAll +qa
# Setup JDK
echo 'export PATH="$PATH:$HOME/jdk/bin"' >> ~/.bashrc
echo "export JAVA_HOME=$HOME/.local/openjdk" >> ~/.bashrc
echo 'alias vim=nvim' >> ~/.bashrc

# Start listener
nohup bash -c 'nvim --listen 0.0.0.0:9001 --headless &'
