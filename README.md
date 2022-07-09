# My very own dotfiles

I wouldn't reccommend you (the random human on the internet) use these, but if you're going to there's no reason I would stop you. Please be aware that my solutions are hacky and there are many who make things work better than these configs do.

To install these, I find it easiest to use an alias that points to the bare git repository.

```
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Then, it's simple enough to clone the repo (but not so simple that I trust myself to do it without pasting the command here).

(FYI, you can also use the SSH link GitHub provides. It can make it easier to push.)

```
git clone --bare https://github.com/raymondheil/dotfiles.git $HOME/.cfg
```

If you use `config status` now it will show you every file in your home directory, which isn't that great. Turn it off with this setting.

```
config config status.showUntrackedFiles no
```

This will also mean you can't see new files unless you add them by name, but it's a decent tradeoff in my opinion.

To get the actual files, you then need to check out. It might tell you that a file cannot be overridden. I usually just delete these, but if you have changes you care about you can always `mv` the old file to make a temporary backup.

```
config checkout
```

Yay! When you first make changes on a new machine (if you're me, of course), you need to set the origin as well. How stable and safe!

```
config push -u origin main
```
