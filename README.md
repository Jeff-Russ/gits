## gits command for Multiple Git

![current cycle: development](https://s3.amazonaws.com/cdn.shared/git-status-badges/current_cycle-development-yellow.svg)  

![status: untested](https://s3.amazonaws.com/cdn.shared/git-status-badges/status-untested-red.svg)  

## NAME

`gits` allows you to toggle between multiple git repositories from the same working directory, each assigned a name

## USAGE

`gits --help` view help message  
`gits <name>` switch to or initialize a new git repository  
`gits <name> <git commands...>` run git command for named repository  
`gits` lists all repository names with option to select  
`gits -a <git commands...>` run git command for all repositories  
`gits --cat-ignore <name>` view .gitignore for named repository  
`gits --cat-readme <name>` view README.* for named repository  
`gits --edit-ignore <name> [EDITOR]` edit .gitignore for named repository  
`gits --edit-readme <name> [EDITOR]` edit README.* for named repository  

NOTE: only the first four above have been implemented.

## DESCRIPTION

`gits` is a wrapper around the git command moves in and out the files associated with a specific git repository before you run the normal git commands. `gits` is always run from the same directory and, unlike Git Submodules, the resulting repositories all share the same main working tree (although you can override this with custom commands).  

Typically, the difference between each would be what you choose to put in each respective `.gitignore` file. 

## USE CASES

It might be preferable publicly available version of a project or website that ignores sensitive data and a private one that does not. There are other reasons why you might want to have multiple version where some ignore certain items. For example, you may use Git to back up an entire WordPress site and a second that omits host specific files allowing you to re-deploy on a different host without errors. Or you may want a repository that only includes code you have added in `wp-admin/plugins` and not the WordPress Core files.  


## INSTALLATION

`cd` to anywhere in your system `$PATH` and run:

$ curl -O https://raw.githubusercontent.com/Jeff-Russ/gits/master/gits

You can actually do this from any location or even at the root of each project you want to use it in and run it as `./gits` 

## SETUP AND USE

Setup is simple, whether you have already run `git init` before, just choose a name for it and type `gits <name>`. To create a second simply run it again with a new name. The old repository will be switched out `git init` will be run and assigned the new name.  

If you type `gits <name>` where `<name>` is a name you previously created, you will be switched to that repository. Now the `.gitignore` and any `README` you see will belong to this repository. At this point you can use the normal git command or gits and the command will be run on this repository.  

You can switch and run the command(s) at once with `gits <name> <git commands...>` which also leaves you in this new repository. 

## CUSTOM COMMANDS

Beside creating and switching repository, you might also want to use `gits` instead of `git` if you have created a custom command. When a custom command is set, it is inserted between the call to `git` and `<git commands...>` when you run `gits <name> <git commands...>` for example. This is useful for changing the main working tree for some repositories. 

