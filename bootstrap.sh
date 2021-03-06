#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

#git pull origin master;

function doIt() {
  rsync --exclude ".git/" --exclude "bootstrap.sh" \
    --exclude "screenshot/" \
    --exclude "README.md" --exclude "alpine/" \
    --exclude "freebsd/" \
    -avh --no-perms . ~;
  source ~/.bashrc;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;

unset doIt;

[ -d "${HOME}/bin" ] || mkdir ~/bin



# download diff-so-fancy (https://github.com/stevemao/diff-so-fancy)
[ -d "~/bin/libexec" ] || mkdir -p ~/bin/libexec
curl -o ~/bin/libexec/diff-so-fancy.pl "https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/libexec/diff-so-fancy.pl"
curl -o ~/bin/diff-highlight "https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight"
curl -o ~/bin/diff-so-fancy "https://raw.githubusercontent.com/stevemao/diff-so-fancy/master/diff-so-fancy"
chmod 755 ~/bin/libexec/diff-so-fancy.pl
chmod 755 ~/bin/diff-highlight
chmod 755 ~/bin/diff-so-fancy

# download git-mv-with-history
curl -o ~/bin/git-mv-with-history "https://gist.githubusercontent.com/emiller/6769886/raw/git-mv-with-history"
chmod 755 ~/bin/git-mv-with-history

# See your latest local git branches, formatted real fancy
# https://github.com/paulirish/git-recent
curl -o ~/bin/git-recent "https://raw.githubusercontent.com/paulirish/git-recent/master/git-recent"
chmod 755 ~/bin/git-recent

# Type `git open` to open the GitHub page or website for a repository in your browser.
# https://github.com/paulirish/git-open
curl -o ~/bin/git-open "https://raw.githubusercontent.com/paulirish/git-open/master/git-open"
chmod 755 ~/bin/git-open

# Recall what you did on the last working day. Psst! or be nosy and find what someone else in your team did ;-)
# https://github.com/kamranahmedse/git-standup
curl -o ~/bin/git-standup "https://raw.githubusercontent.com/kamranahmedse/git-standup/master/git-standup"
chmod 755 ~/bin/git-standup

# Git quick statistics is a simple and efficient way to access various statistics in git repository.
# https://github.com/arzzen/git-quick-stats
curl -o ~/bin/git-quick-stats "https://raw.githubusercontent.com/arzzen/git-quick-stats/master/git-quick-stats"
chmod 755 ~/bin/git-quick-stats

# Simple and handy tool to easily recall what you've done
# https://github.com/Fakerr/git-recall
curl -o ~/bin/git-recall "https://raw.githubusercontent.com/Fakerr/git-recall/master/git-recall"
chmod 755 ~/bin/git-recall
