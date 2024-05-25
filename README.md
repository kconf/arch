# Bootstrap a new machine

## Arch Linux

- Add `archlinuxcn` repository

See [pacman.conf](./etc/pacman.conf) for details.

~~~ sh
pacman-key --lsign-key "farseerfc@archlinux.org"
pacman -Sy archlinuxcn-keyring
~~~

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
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
~~~

And add the following to `/etc/nix/nix.conf`:

~~~ conf
substituters = https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store https://cache.nixos.org/
trusted-users = hjw
~~~

Finally run:

~~~ sh
sudo systemctl restart nix-daemon
home-manager switch
~~~
