## gits command for Multiple Git

![current cycle: development](https://s3.amazonaws.com/cdn.shared/git-status-badges/current_cycle-development-yellow.svg)  

![status: untested](https://s3.amazonaws.com/cdn.shared/git-status-badges/status-untested-red.svg)  

`gits` is very simple - it lets you initialize and toggle between multiple Git repositories from the same main working directory. Basically it just moves out the `.git` and `.gitignore` and brings in a new one whenever you toggle. The only difference between each would be what you choose to put in each respective`.gitignore` file.  

This is useful if you want, for example, a publicly available version of a project that ignores sensitive data and a private one that does not. It can also be used where you would normally use submodules (only they would all have the same main working tree (top level folder) unless you do something fancy with `-C` or `--work-tree=subfolder`). An example of this sort of case might be applying Git to a an entire WordPress site where you have one repository that backs the whole thing up, one that omits host specific files or one what only includes code you have added to the WordPress Core files.  

## Installation

`cd` to anywhere in your system `$PATH` and run:

$ curl -O https://raw.githubusercontent.com/Jeff-Russ/gits/master/gits

You can actually do this from any location or even at the root of each project you want to use it in.  


## gits setup

Note that the following show gits being run simply as `gits` but if you don't have it in your `$PATH` you'll need to specify the full path of the `gits` file. If it's right at the root of your gits project you would type `./gits` instead.  

For any given project that you want to create multiple git repositories from you should run all `gits` commands from the top directory, referred to in git terminology as the "main working directory" but in this document I'll call simply the "__project root__".  

You can decide you want more than one git either before or after you have already initialized git but once you have decided to go forward and use `gits` there are a few thing you should do slightly different. But before we address that, here is how you get started.  

    $ cd wherever/your/project/dir/is
    $ # optionally run this to see some info much like this README:
    $ gits help
    $ gits setup
        A directory ending with '_gits' needs to be created.
        Enter something to prepend the name (start with . to make hidden)
        or just hit enter to name it _gits:
    $ .
        Success.
        <a brief instructional>

If you `gits` finds that you had run `git init` in this location (by seeing the `.git/` directory) it will prompt you to enter a name for this "gits" before "Success." This name is used by `gits` to keep track of which "gits" is which. In the above example, if you had a a git repository there and choose the name "project x" a directory called  `._gits` will be made at the project root and also `._gits/project x`.  

In this example I choose to prepend `_gits/` with a dot to make it hidden but you might actually prefer not to have it hidden so you can see the names and details of each "gits" in this directory easily. There is, however, a way to list out what you have with the `gits` which we will see later.  

## gits init

After `git setup` was run you should never run the normal `git init`. Whether you never had a git repository there or are creating a second or subsequent gits you need to run  `git init`

