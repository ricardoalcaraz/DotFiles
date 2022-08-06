mkdir ~/.ssh/
mv -f ~/.ssh/config ~/.ssh/config.bak
ln .ssh/config ~/.ssh/config

git config --global user.email "ralcarazerhs@gmail.com"
git config --global user.name "ralcaraz"

mv -f ~/.zshrc ~/.zshrc_bak
ln -b .zshrc ~/.zshrc

mv -f ~/.zprofile ~/.zprofile.bak
ln -b .zprofile ~/.zprofile

mv -f ~/.zshenv ~/.zshenv.bak
ln -b .zshenv ~/.zshenv