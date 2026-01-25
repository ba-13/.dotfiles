OS_ID := $(shell grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')

.PHONY: all install-pkgs setup-configs

all: install-pkgs install-uv

install-yay:
ifeq ($(OS_ID), arch)
	# Check if yay is installed, if not, bootstrap it
	@command -v yay --help >/dev/null 2>&1 || { \
		echo "Installing yay..."; \
		sudo pacman -S --needed base-devel git; \
		git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin; \
		cd /tmp/yay-bin && makepkg -si --noconfirm; \
	}
	yay -S --needed - < pkglist_aur.txt
endif

install-pkgs:
ifeq ($(OS_ID), arch)
	sudo pacman -Syu --needed $$(cat pkglist_arch.txt)
else ifeq ($(OS_ID), ubuntu)
	sudo apt update && sudo apt install -y $$(cat pkglist_ubuntu.txt)
endif

install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

store-current-pkgs:
ifeq ($(OS_ID), arch)
	pacman -Qenq > pkglist_arch.txt
	pacman -Qemq | grep -v 'yay*' > pkglist_aur.txt
else ifeq ($(OS_ID), ubuntu)
	apt-mark showmanual > pkglist_ubuntu.txt
endif

systemctl-enable:
	@echo Warning: enabling systemctl, reboot afterwards\; Continue? [Y/n]
	@read line; if [ $$line != "y" ]; then echo aborting; exit 1 ; fi
	sudo systemctl enable NetworkManager
	sudo systemctl enable iwd
	systemctl --user enable pipewire wireplumber
	sudo systemctl enable tlp.service

make-swapfile:
	@echo Warning: Creating swap\; Continue? [Y/n]
	@read line; if [ $$line != "y" ]; then echo aborting; exit 1 ; fi
	sudo fallocate -l 8G /swapfile
	sudo chmod 600 /swapfile
	sudo mkswap /swapfile
	sudo swapon /swapfile
	swapon --show
