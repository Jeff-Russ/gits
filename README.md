## gits command for Multiple Git

![current cycle: development](https://s3.amazonaws.com/cdn.shared/git-status-badges/current_cycle-development-yellow.svg)  

![status: untested](https://s3.amazonaws.com/cdn.shared/git-status-badges/status-untested-red.svg)  

## NAME

`gits` allows you to toggle between multiple git repositories from the same working directory, each assigned a name

## COMMON USAGE

`gits --help` view help message  
`gits <name>` switch to or initialize a new git repository  
`gits` show list of all named repositories and currently active.  
`gits <name> [git_commands...]` run git command for named repository  
`gits "" [git_commands...]` run git command for currently active repository  
`gits` lists all repository names with option to select  
`gits --gitignore` cat gitignore for the active repository  
`gits --gitignore [cmd>]` run command on .gitignore for active repository  
`gits --gitignore [cmd] [name]` run command on .gitignore for named repository  
`gits --gitignore "" <name>` run cat on .gitignore for repository  
NOTE: `-gi` can be used instead of `--gitignore`  
  
`gits --readme` cat README.* for the active repository  
`gits --readme <cmd>` run command on README.* for active repository  
`gits --readme <cmd> <name>` run command on README.* for named repository  
`gits --readme "" <name>` run cat on README.* for named repository  
NOTE: `-rm` can be used instead of `--readme`  
  
NOTE: the features below are experimental.  

`gits --all [git_commands...]` run git command for all repositories  
NOTE: `-a` can be used instead of `--all`  

## DESCRIPTION

`gits` is a wrapper around the git command can be used as an alternative to Git Submodules. Unlike Git Submodules, all `.gitignore` files `.git/` directories are kept in a central location at the top directory and are moved in and out, depending on which you want to run commands on. The multiple repositories all share the same main working tree (top level directory) unless you override this with custom commands. In other words, you will run everything from the same location.  

Typically, the difference between each would be what you choose to put in each respective `.gitignore` file. You would often want to use a "whitelisting" method in `.gitignore` so they different repositories include exclusive content.  

If you create a file called `README.*`, at the main working tree, it too will be kept separate to each repository along with `.gitignore` and `.git/`.  

## USE CASES

It might be preferable to have a publicly available version of a project or website that ignores sensitive data and a private one that does not. There are other reasons why you might want to have multiple version where some ignore certain items and others don't. For example, you may use Git to back up an entire WordPress site and a second that omits host specific files allowing you to re-deploy on a different host without errors. Or you may want a repository that only includes code you have added in `wp-admin/plugins` and not the WordPress Core files.  

## INSTALLATION

From any location in terminal:  

    $ curl -O https://raw.githubusercontent.com/Jeff-Russ/gits/master/gits
    $ ./gits --install

The above will also delete the downloaded file before copying it to the  `~/bin` directory, which it will be created and added to `$PATH` if not already.  

## SETUP AND USE

__Setup__  

Like most things with `gits`, setup is simple. If you have already run `git init` before, just choose a name for it and by running `gits <name>`. If you have not run `git init` this will happen with `gits <name>` if this is the first time `gits` sees `name`.  

__Adding More__  

To create a second repository simply run it again with a new name. The old repository will be switched out `git init` will be run and assigned the new name.  

__Switching__  

If you type `gits <name>` where `<name>` is a name you previously created, you will be switched to that repository. Now the `.gitignore` and any `README` you see will belong to this repository. At this point you can use the normal git command and the command will be run on this repository.  

__Checking Status__  

Simply run `gits` alone, without any arguments, to see a list of all repository names followed by the name of the one currently active.  

__Fast Switching__  

You can switch and run the command(s) at once with `gits <name> <git commands...>` which also leaves you in this new repository. If you want to run something on the currently active repository you can simply provide the dummy argument `""` instead of it's actual name. For example:  

    $ gits "" status

This probably is not useful over simply running a command directly with `git` unless you are set up to run a custom command (see section below).

__Fast Editing and Viewing__  

The `--gitignore` / `-gi` and `--readme` / `-rm` flags give you quick access to these files. The optional second argument is command you would like to run on this file, which defaults to the `cat` command. The optional third argument is the name of the repository you assigned, which defaults to the currently active one. The following will display the files in the terminal for the active git repository:  

    $ gits --gitignore # runs $ cat .gitignore
    $ gits -gi         # same as above
    $ gits --readme    # runs cat on file starting "REAME."
    $ gits -rm         # same as above

Adding a second argument to any of the above would let you run something other than `cat`. This is useful for opening in an editor (you could put `vim` as this argument).  The third argument lets you run the command on another repository __and does so without actually switching to it__.  

    $ gits --gitignore cat "other name"
    $ gits -gi "" "other name" # same as above
    $ gits -gi vim "other name" open .gitignore for "other name" in vim

## CUSTOM COMMANDS

Beside creating and switching repository, you might also want to use `gits` instead of `git` if you have created a custom command. When a custom command is set, it is inserted between the call to `git` and `<git commands...>` when you run `gits <name> <git commands...>`  This might be useful if you want a different main (top) working tree for one or more repositories. In this case might want to insert `--work-tree=<directory>`.  

`gits` will look for a line starting `#CUSTOM_CMD=` in the respective `.gitignore` and use whatever follows the `=` to the end of the line as the custom command.  

Keep in mind the the actual `git` command is never run by `gits` when the second argument is a flag. It is only run when the second argument is the name assigned to the repository or `""`, which is a shortcut for the currently active repository name.  


