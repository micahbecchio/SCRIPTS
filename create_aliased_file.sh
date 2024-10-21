#!/bin/bash

#######################################
#                                     #
# QUICK WRITE FOR TERMINAL HELP CATS  #
#              /ᐠ｡ꞈ｡ᐟ\ _ )            #
#######################################

# 0.) Variables
# 1.) Write text File
# 2.) Write alias
# 3.) Source file

# ----------------------------------- #

# 0.)
echo -n "FILE NAME: "
read file_name 

echo -n "ALIAS NAME: "
read alias_name

echo "FILE CONTENT:  "
file_content=$(cat)

# 1.) Write text File ------------
cat <<EOL > ~/SCRIPTS/$file_name.txt
$file_content
EOL

# 2.) Write alias ----------------
echo "alias $alias_name='cat ~/SCRIPTS/$file_name.txt'" >> ~/.bash_aliases

# 3.) SOURCE ---------------------
source ~/.bashrc

echo "File created, and alias added successfully."
