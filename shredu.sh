#!/bin/bash
# (C) 2022-2023 Benjamin Steenkamer
# Overwrites the specified file(s) with 1 pass of random data, a final pass of all zeros, and then removes the file(s).
# FLAGS: -r, -f, or -rf
# r = recursively shred and remove all files in directory
# f = force shredding of file
# FIXME files with spaces
# FIXME folders with spaces

NUM_RANDOM_PASS=1

function shredu_func() {
    for file in $@; do
        local shred_result=0
        if [ -d $file ]; then
            echo "shredu: -r not specified; skipping directory '$file'" >> "/dev/stderr"
        else
            local args="-vz$force""un"
            shred $args $NUM_RANDOM_PASS "$file"
            shred_result=$?
        fi
        if [ $shred_result -ne 0 ]; then
            exit $shred_result      # Stop script if a file failed to be shredded
        fi
    done
}

recurse=false
force=""
if [ "$1" = "-r" ] || [ "$1" = "-rf" ] || [ "$1" = "-fr" ]; then
    recurse=true
fi
if [ "$1" = "-f" ] || [ "$1" = "-rf" ] || [ "$1" = "-fr" ]; then
    force="f"
fi
if $recurse || [ "$force" = "f" ]; then
    shift   # Remove recurse and/or force argument
fi

if $recurse; then
    cmd_args=$@     # Save to new var because @ will be overwritten when function is called
    for cmd_arg in $cmd_args; do
        if [ ! -d $cmd_arg ] && [ ! -f $cmd_arg ]; then
            echo "shredu: no such file or directory; skipping '$cmd_arg'"
            continue
        fi

        recurse=$(find $cmd_arg -name "*")  # Recursively finds all files and directories
        for rec in $recurse; do
            if [ ! -d $rec ]; then   # Directory won't work with shred command
                shredu_func $rec
            fi
        done

        # TODO: --preserve-tree
        # When -r is passed, keep folders but delete files
        # Otherwise rename folder, then delete; should be the default -r action
        # FIXME: If shred fails on file, don't want to to use regular rm on folder; should warn user
        # if [ -d "$cmd_arg" ]; then
        #     echo "rm -r$force $cmd_arg"
        #     rm -r$force $cmd_arg
        # fi
    done
else
    shredu_func $@
fi
