# My very own dotfiles!

Hello there, random internet person! These are the configuration files I use on
my laptop, at least the useful ones I want to keep.

I wouldn't recommend anyone besides me use them, but if you're going to there's
no reason I should stop you. Beware, for here be (messy) code dragons!

# Cloning this repo

This repo is best managed as a bare git repository, with the actual git files
somewhere in your home directory. Below you'll find the instructions I use to
get them onto a new computer.

If you aren't me the bare git repo might matter less (by which I mean you can
clone the repo normally and just move the files into their correct directories
yourself.) After all, you probably don't care about getting the \~latest updates\~
on these dotfiles.

First, clone the bare repo into `~/.cfg`:

```
git clone --bare git@github.com:almondheil/dotfiles.git $HOME/.cfg
```

Then, alias access to that repo to something like `config`. You don't need to
make this change persistent, in my actual dotfiles it gets set as well.

```
alias config='git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

While you're at it, tell this repo not to warn you about untracked files
because...well, your entire home directory is technically untracked now.

```
config config status.showUntrackedFiles no
```

At this point, you don't actually have any files from the repo. To get them,
just do a checkout.

```
config checkout
```

Odds are you'll get a warning at this point, complaining that there are files
that would be overwritten. But any files that are already here are vastly
inferior to the ones in the repo, so you can just delete them and try again ;)

At this point, it's also good to tell git which branch we're on. The simplest
way to do this (don't worry, it won't create a commit on the repo) is just to
pretend you're doing a push and set the upstream there.

```
config push -u origin main
```

All set, happy configuration!

# License

This repo isn't really *software* in any way, so the content is licensed under
the [Creative Commons BY-SA 4.0
License](https://creativecommons.org/licenses/by-sa/4.0/) except where otherwise
mentioned. This is particularly true for code I have adapted from other authors,
where licenses will be noted at the top of the relevant file.
