# Dotfiles as bare repo

This repo is present in $HOME, and needs to support `ubuntu-24` and `arch`, the platforms I am using.
To setup a new PC with either OS, use the following commands, picked from [atlassian](https://www.atlassian.com/git/tutorials/dotfiles)

```bash
git clone --bare git@github.com:ba-13/.dotfiles $HOME/.cfg
alias config="/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME"

mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
	echo "Checked out config";
	rmdir .config-backup
else
	echo "Backing up pre-existing dotfiles";
	config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
if [ $? -ne 0 ]; then
	echo "Something is wrong"
	return
fi;
config config status.showUntrackedFiles no
```

All files are ignored by default using `.gitignore`. One needs to add new dotfiles/configuration files manually using `config add -f`, keeping them consciously leads to a cleaner
workspace. The root files which are changed are kept in `system/` folder, replicating the file structure where they are present. Therefore
whenever one changes a root owned file, it is recommended to either copy the final form here, or hard link it (I am copying to not mess with the permissions).
Force adding a file makes git start keeping track of them, so modifying those files can be easily done `config add -A` without force again.

