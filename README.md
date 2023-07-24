dotfiles
========

Clone. Run `./install.sh`. YouCompleteMe will take a while.

Add git things:

```bash
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt install git
```

```bash
git config --global pull.rebase true
git config --global rebase.autoStash true
git config --global push.autoSetupRemote true
git config --global merge.directoryRenames true
```
