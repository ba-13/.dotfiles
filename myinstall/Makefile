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

install-zotero:
	wget --content-disposition "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" -O Zotero.tar.xz
	tar -x Zotero.tar.xz
