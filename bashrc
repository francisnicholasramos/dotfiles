profile() {
  vi ~/.bashrc
}

so() {
  source ~/.bashrc
}

tmup() {
  tmux source-file ~/.tmux.conf
}

d() {
  cd /mnt/HDD/
}

host() {
  sudo vi /etc/hosts
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
color_prompt=yes
if [ "$color_prompt" = yes ]; then
  PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi
