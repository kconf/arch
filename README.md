# Bootstrap a new machine

## Arch Linux

- Show installed packages

~~~ sh 
comm -23 <(pacman -Qqett | sort) <(pacman -Qqg base-devel | sort | uniq)
~~~ 

- Install packages from a file containing all packages

~~~ sh
sudo pacman -S --needed $(sed -e 's/\s*#.*$//' packages.txt)
paru -S $(sed -e 's/\s*#.*$//' aur.txt)
~~~

## Ansible

~~~ sh
ansible-playbook --ask-become-pass main.yml
~~~

## Nix

~~~ sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
~~~
