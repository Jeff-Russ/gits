GITS 1 "SEPT 2016" Linux "User Manuals"
=======================================

NAME AND STATUS
---------------

`gits` allows you to toggle between multiple git repositories from the same working directory, each assigned a name.  
`gits` is currently in development and has not been tested.  

SYNOPSIS
--------

`gits` <_name_> <_git-commands_...>  
`gits` [`--gitignore` | `-gi`] <_command_> <_name_>  
`gits` [`--readme` | `-rm`] <_command_> <_name_>  
`gits` [`--all` | `-a`] \[_git-commands_...]  
`gits` [`--help` ]  

TYPICAL USEAGE
--------------

FLAGLESS USEAGE: `gits` <_name_> <_git-commands_...>  

    $ gits name1          # initialize a new git repository called "name1"  
    $ gits name2          # initialize and switch to new repository called "name2"  
    $ gits                # lists both names and show name2 as active  
    $ gits name1          # switch to name1 as active  
    $ gits name2 status   # switches to name2 and runs `git status`  
    $ gits name2 add -A   # stay on name2 and run `git add -A`  
    $ gits "" add -A      # shorthand for previous 
  
GITIGNORE FLAGS: `gits` [`--gitignore` | `-gi`] <_command_> <_name_>  
  
    $ gits -gi cat name1  # run `cat` on name1's .gitignore (without switching)  
    $ gits -gi vim name2  # open name2's .gitignore in vim
    $ gits -gi vim        # since name2 is active, this is shorthand for previous
    $ gits -gi            # if not specified, the command defaults to `cat`  
    $ get --gitignore     # long way to to previous et al
    $ gits -gi "" name2   # `""` will default to `cat`

  
README FLAGS: `gits` [`--readme` | `-rm`] <_command_> <_name_>  

    $ gits -rm cat name1  # run `cat` on name1's /README.* (without switching)  
    $ gits -rm vim name2  # open name2's /README.* in vim
    $ gits -rm vim        # since name2 is active, this is shorthand for previous
    $ gits -rm            # if not specified, the command defaults to `cat`  
    $ get --readme     # long way to to previous et al
    $ gits -rm "" name2   # `""` will default to `cat`

WARNING: the feature(s) below are experimental:  

ALL FLAGS: `gits` [`--all` | `-a`] \[_git-commands_...]  
`-all` or `-a` runs git command(s) for all repositories  

DESCRIPTION
------------

`gits` is a wrapper around the git command can be used as an alternative to Git Submodules. Unlike Git Submodules, all `.gitignore` files `.git/` directories are kept in a central location at the top directory and are moved in and out, depending on which you want to run commands on. The multiple repositories all share the same main working tree (top level directory) unless you override this with custom commands. In other words, you will run everything from the same location.  

Typically, the difference between each would be what you choose to put in each respective `.gitignore` file. You would often want to use a "whitelisting" method in `.gitignore` so they different repositories include exclusive content.  

If you create a file called `README.*`, at the main working tree, it too will be kept separate to each repository along with `.gitignore` and `.git/`.  

USE CASES
---------

It might be preferable to have a publicly available version of a project or website that ignores sensitive data and a private one that does not. There are other reasons why you might want to have multiple version where some ignore certain items and others don't. For example, you may use Git to back up an entire WordPress site and a second that omits host specific files allowing you to re-deploy on a different host without errors. Or you may want a repository that only includes code you have added in `wp-admin/plugins` and not the WordPress Core files.  

INSTALLATION
------------

From any location in terminal:  

    $ curl -O https://raw.githubusercontent.com/Jeff-Russ/gits/master/install.sh
    $ chmod 755 ./install.sh  # if needed
    $ ./install.sh
    $ rm ./install.sh # if you want to clean up after install


SETUP AND USE
------------

__Setup:__ Like most things with `gits`, setup is simple. If you have already run `git init` before, just choose a name for it and by running `gits <name>`. If you have not run `git init` this will happen with `gits <name>` if this is the first time `gits` sees `name`.  

__Adding More:__ To create a second repository simply run it again with a new name. The old repository will be switched out `git init` will be run and assigned the new name.  

__Switching:__ If you type `gits <name>` where `<name>` is a name you previously created, you will be switched to that repository. Now the `.gitignore` and any `README` you see will belong to this repository. At this point you can use the normal git command and the command will be run on this repository.  

__Checking Status:__ Simply run `gits` alone, without any arguments, to see a list of all repository names followed by the name of the one currently active.  

__Fast Switching:__ You can switch and run the command(s) at once with `gits <name> <git commands...>` which also leaves you in this new repository. If you want to run something on the currently active repository you can simply provide the dummy argument `""` instead of it's actual name. For example:  

    $ gits "" status

This probably is not useful over simply running a command directly with `git` unless you are set up to run a custom command (see section below).

__Fast Editing and Viewing:__ The `--gitignore` / `-gi` and `--readme` / `-rm` flags give you quick access to these files. The optional second argument is command you would like to run on this file, which defaults to the `cat` command. The optional third argument is the name of the repository you assigned, which defaults to the currently active one. The following will display the files in the terminal for the active git repository:  

    $ gits --gitignore # runs $ cat .gitignore
    $ gits -gi         # same as above
    $ gits --readme    # runs cat on file starting "REAME."
    $ gits -rm         # same as above

Adding a second argument to any of the above would let you run something other than `cat`. This is useful for opening in an editor (you could put `vim` as this argument).  The third argument lets you run the command on another repository _and does so without actually switching to it_.  

    $ gits --gitignore cat "other name"
    $ gits -gi "" "other name" # same as above
    $ gits -gi vim "other name" open .gitignore for "other name" in vim

CUSTOM COMMANDS
----

Beside creating and switching repository, you might also want to use `gits` instead of `git` if you have created a custom command. When a custom command is set, it is inserted between the call to `git` and `<git commands...>` when you run `gits <name> <git commands...>`  This might be useful if you want a different main (top) working tree for one or more repositories. In this case might want to insert `--work-tree=<directory>`.  

`gits` will look for a line starting `#CUSTOM_CMD=` in the respective `.gitignore` and use whatever follows the `=` to the end of the line as the custom command.  

Keep in mind the the actual `git` command is never run by `gits` when the second argument is a flag. It is only run when the second argument is the name assigned to the repository or `""`, which is a shortcut for the currently active repository name.  


AUTHOR
------

Jeff Russ <https://github.com/Jeff-Russ/gits>
