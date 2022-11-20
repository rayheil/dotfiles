# My very own dotfiles!

Hello there, random internet person! These are the configuration files I use on my laptop, at least the useful ones I want to keep.

I wouldn't reccommend anyone besides me use them, but if you're going to there's no reason I should stop you. Beware, for here be (messy) code dragons! 

# Installation

I keep this section here so I know what to do when I put everything on a new computer. Otherwise, I'm going to forget it all.

I have everything set up to work through a bare git repo. If you're me and have
your SSH keys ready, you can do it with SSH:

```
git clone --bare git@github.com:raymondheil/dotfiles.git $HOME/.cfg
```

otherwise, HTTPS is the option you'll want:

```
git clone --bare https://github.com/raymondheil/dotfiles.git $HOME/.cfg
```

Then, I think it's useful to alias everything so it's easier to work with the files. I call my alias `config`.

Of course, it's also nice to put this in the relevant \*.rc file in your home directory.

```
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

It's also really nice to have `config status` only show you explicitly tracked files, because otherwise it'll show your *entire* home profile
as untracked, making the output almost useless.

This will also mean you can't see new files unless you add them by name, but it's a decent tradeoff in my opinion.

```
config config status.showUntrackedFiles no
```

To get the actual files, you then need to check out. 

Odds are you'll get warning message that some file cannot be overridden. In this case, you need to get rid of it (deleting it, renaming it, etc.)
before continuing.

```
config checkout
```

Then, everything should be set up! If you're me and have push access to the repo, you also should probably change the repo origin
to your local branch if you plan to update things from this computer.

```
config push -u origin main
```
