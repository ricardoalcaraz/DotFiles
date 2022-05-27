sudo pacman -Syu git openssh vim --noconfirm
mkdir ~/.ssh/
ln .ssh/config ~/.ssh/config

git clone https://aur.archlinux.org/yay.git
cd yay

makepkg -si --noconfirm
rm -rf yay
yay

git config --global user.email "ralcarazerhs@gmail.com"
git config --global user.name "ralcaraz"