Dotfiles in Git
===============

I've recently discovered that keeping your dotfiles in git is one of the
neatest tricks since sliced bread. I've taken the time to make a little
Python script that symlinks all the dotfiles here to your homedir.

To use these dotfiles (or customise the set up for your own use):

1. `git clone git://github.com/mikl/dotfiles.git` - you might want to
   rename the resulting dotfiles folder to something else. I keep mine
   in ~/.dotfiles.git but anywhere should work.
2. Customise the RC-files to your own liking and add your own.
3. Run `python linkdotfiles` in the folder you checked it out.
   Use the -f option if you want your old dotfiles to be overwritten
   (otherwise, linkdotfiles will only link those that do not exist).
4. Optionally, set up a central git repository so you can share your
   dotfiles across your machines. (If you don't have your own server for
   that sort of thing, you can fork [my repository on Github](http://github.com/mikl/dotfiles/tree/master). 
5. Enjoy.

