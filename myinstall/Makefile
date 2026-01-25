OS_ID := $(shell grep -oP '(?<=^ID=).+' /etc/os-release | tr -d '"')

.PHONY: all install-pkgs setup-configs

all: install-pkgs install-uv

install-pkgs:
	ifeq ($(OS_ID), arch)
		sudo pacman -Syu --needed $$(cat pkglist_arch.txt)
	else ifeq ($(OS_ID), ubuntu)
		sudo apt update && sudo apt install -y $$(cat pkglist_ubuntu.txt)
	endif

install-uv:
	curl -LsSf https://astral.sh/uv/install.sh | sh

