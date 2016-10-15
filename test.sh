#!/bin/bash

get_arg_option () {
    # alway set arg_option first, then call like:
    # value=$(get_arg_option  "$@")
    # or
    # if value=$(get_arg_option  "$@") ; then 
    result=1
    for arg in "$@"; do 
        if [ "$result" -eq "0" ]; then
            echo "$arg"
            break
        fi
        [[ "$arg" = "$arg_option" ]] && result=0
        shift
    done
    return $result
}

# VARS ________________________________________________________________________

arg_option="--verbose"
verbose=$(get_arg_option  "$@") || verbose="default"
echo "verbose=$verbose"

arg_option="--update"
update=$(get_arg_option  "$@") || update="default"

echo "update=$update"

