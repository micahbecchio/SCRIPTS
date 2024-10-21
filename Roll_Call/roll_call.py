
#   _____       _ _    _____      _ _ 
#  |  __ \     | | |  / ____|    | | |
#  | |__) |___ | | | | |     __ _| | |
#  |  _  // _ \| | | | |    / _` | | |
#  | | \ \ (_) | | | | |___| (_| | | |
#  |_|  \_\___/|_|_|  \_____\__,_|_|_|
#                                    
# Did we actually download all the files we had intended?
# Match files in directory against a list.                                   

#-----------#
# LIBRARIES #
#-----------#
import os
import sys

#-----------#
# FUNCTION  #
#-----------#
# 1.) READ LIST
# 2.) STORE ITEMS IN A SET

if len( sys.argv ) > 2:
    with open( sys.argv[1], "r") as file:

        expected_files = set()

        for line in file:
            line = line.strip()
            items = line.split(",")

            for i in items:
                item = i.strip()
                expected_files.add( item )

    # COMPARISON DIRECTORY 
    directory_path = sys.argv[2]
    
else:
    print("Please provide the path and list file as a command-line argument.")
    sys.exit(1)

# 1.) READ DIRECTORY
# 2.) STORE ITEMS IN A SET

current_files = set()
for entry in os.scandir( directory_path ):
    if entry.is_file():
        current_files.add( entry.name )

# 1.) COMPARE SETS
missing_files = expected_files - current_files
unexpected_files  = current_files - expected_files

if missing_files:
    print("\nMissing files:")
    for file in missing_files:
        print( file )

if unexpected_files:
    print("\nUnexpected files:\n")
    for file in unexpected_files:
        print( file )

# VICTORY COMMENCEMENT:
if not missing_files and not unexpected_files:
    print("All files are present and accounted for, sir! ヾ(⌐■_■)/")       