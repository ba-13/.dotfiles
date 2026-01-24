# Dotfiles as bare repo

This repo is present in $HOME, and needs to support `ubuntu-24` and `arch`, the platforms I am using.
To setup a new PC with either OS, use the following commands, picked from [atlassian](https://www.atlassian.com/git/tutorials/dotfiles)

```bash
git clone --bare git@github.com:ba-13/.dotfiles $HOME/.cfg
function config {
	/usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME $@
}

mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
	echo "Checked out config";
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

One needs to add new dotfiles manually using `config add`

