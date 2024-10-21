#!/bin/bash

###################################
#                                 #
# QUICK TERMINAL-BOUND TO-DO LIST #
#                                 #
###################################

# 1.) 'File name' if saving to file
# 2.) FUNCTIONS: show_usage (commands help)
#.. list_items (list all items, from: file or terminal save)
#.. add_item (add item to list)
#.. remove_item
#.. mark_done (mark item as [done]. most likely via index)
#.. delete_list (delete list)
# 3.) CHECK IF FILE EXISTS~! (if not, create it)
# 4.) Take USER INPUT (via: read)
# 5.) check user input CASE against functions [list_items, add_item, mark_done]

#-- 1.) VARIABLES ------------
FILE="bash_list.txt" #1

#-- 2.) FUNCTIONS ------------

function list_items() {
    # LIST ALL ITEMS.
    # (-n) for line numbers
    cat -n $FILE
}

function add_item() {
    # Count lines in file, 
    # word count (wc) line number + item to file
    echo "Adding item..."
    echo "$@" >> $FILE # add item to file. "$@" = all arguments from string. 
}

function remove_item(){
    # REMOVE line via SED
    echo "Removing item $1..."
    sed -i '' "$1d" "$FILE"
}

function mark_done() {
    # [DONE]
    # NOTE: sed for linux might not require the arg ('' ) for a backup file save.

    echo "Marking item as done..."
    local line=$1
    sed -i '' "${line}s/^/[DONE] /" "$FILE"

    # SED: Replace directly in file (-i), at line number ($line), with [DONE] in front (^) of the line. no backup file ('')
}

function delete_list() {
    echo "Deleting list..."
    rm $FILE
}

function list_alias(){

    local current=$(pwd)
    echo alias list=\"$current/main.sh\" >> ~/.bash_profile
    echo 'Call script with: "list"'
    }

function help() {
    echo "Usage: bash main.sh [option] [argument]"
    echo "Options:"
    echo "  list: list all items"
    echo "  add: add item to list"
    echo "  remove: remove item from list"
    echo "  done: mark item as done"
    echo "  clear: delete list"
    echo "  alias: create alias (hardcoded: \"list\") for script"}
}

#-- 3.) CHECK IF FILE EXISTS ------------
# if does not (!) file (-f) exist, then create it.

if [ ! -f "$FILE" ]; then
    touch "$FILE"
fi

#-- 4.) Take USER INPUT ------------

case $1 in
    list)
        list_items
        ;;
    add)
        add_item $2
        ;;
    remove)
        remove_item $2
        ;;
    done)
        mark_done $2
        ;;
    clear)
        delete_list
        ;;
    alias)
        list_alias
        source ~/.bash_profile 
        ;;
    *) # default response
        help
        ;;
esac