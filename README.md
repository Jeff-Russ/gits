# gits command for Multiple Git

![current cycle: development](https://s3.amazonaws.com/cdn.shared/git-status-badges/current_cycle-development-yellow.svg)  

![status: untested](https://s3.amazonaws.com/cdn.shared/git-status-badges/status-untested-red.svg)  

`gits` is very simple - it lets you initialize and toggle between multiple Git repositories from the same main working directory. Basically it just moves out the `.git` and `.gitignore` and brings in a new one whenever you toggle. The only difference between each would be what you choose to put in each respective`.gitignore` file.  

This is useful if you want, for example, a publicly available version of a project that ignores sensitive data and a private one that does not. It can also be used where you would normally use submodules (only they would all have the same main working tree (top level folder) unless you do something fancy with `-C` or `--work-tree=subfolder`). An example of this sort of case might be applying Git to a an entire WordPress site where you have one repository that backs the whole thing up, one that omits host specific files or one what only includes code you have added to the WordPress Core files.  

