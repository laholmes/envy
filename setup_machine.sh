set -euo pipefail

echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

echo "Installing node..."
brew install node

echo "Installing java..."
brew cask install java
 
echo "Setting up the shell..."
mkdir ~/dev
cd ~/dev
git clone https://github.com/mrdecav/envy.git
cd envy/Bootstrapping
./osx.sh
. ~/.bash_profile

echo "Installing packages..."
brew install wget
brew cask install 1password
brew cask install diffmerge
brew cask install google-chrome
brew cask install sublime-text
brew cask install intellij-idea
brew cask install slack
brew cask install microsoft-office
brew cask install spotify
brew cask install sketchbook
brew cask install sketch
brew cask install skype
brew cask install zoomus

echo "Installing typefaces..."
brew tap caskroom/fonts
brew cask install font-montserrat
brew cask install font-raleway
brew cask install font-roboto
brew cask install font-open-sans
brew cask install font-fontawesome
brew cask install font-material-icons

echo "Configuring diffmerge..."
git config --global diff.tool diffmerge
git config --global difftool.diffmerge.cmd "/usr/local/bin/diffmerge \"\$LOCAL\" \"\$REMOTE\""

git config --global merge.tool diffmerge
git config --global mergetool.diffmerge.trustExitCode true
git config --global mergetool.diffmerge.cmd "/usr/local/bin/diffmerge --merge --result=\"\$MERGED\" \"\$LOCAL\" \"\$BASE\" \"\$REMOTE\""