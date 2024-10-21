![Bash_List Banner Image](static/banner_bash_list.jpg)

<br>
A command-line to-do list manager for quick and easy task tracking directly within your terminal.

<p>
<p>
<div align="center">
    <img src="static/bash_list_demo.gif" alt="Bash_List demo gif">
</div>

## Features

- **List Items**: Display all your to-do items with ease.
- **Add Items**: Quickly add new tasks to your list.
- **Remove Items**: Remove tasks that are no longer needed.
- **Mark Items as Done**: Check off completed tasks.
- **Delete List**: Clear your entire to-do list when needed.

## Usage

To get started, clone the repository and run the script:

```bash
git clone https://github.com/micahbecchio/Bash_List.git
cd Bash_List
./main.sh alias # Will auto-create alias 'list', available to call from anywhere.
```
<br>
Available commands:

- `list` - Display all available commands.
- `list list` - List all to-do items.
- `list add "Your task here"` - Add a new item.
- `list remove [item-number]` - Remove an item.
- `list done [item-number]` - Mark an item as done.
- `list clear` - Delete all items from the list.

## Dependencies

- Bash shell
- `sed` for inline editing of files
- `cat` for displaying file contents