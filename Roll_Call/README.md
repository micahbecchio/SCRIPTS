![Roll_Call. Yessir.](Static/roll_call_banner.jpg)
<!-- banner -->

<i>"Roll Call"</i> is a Python script designed to ensure that all intended files are present in a specified directory. It matches the files currently in the desired directory against a provided list, verifying the presence of expected files.  

<i>Original use-case:</i> I wrote this script to verify that I had downloaded all the gene accession files from the nucleotide archive, exactly matching a complete list of subject accession numbers.
<!-- GIF. -->
<p align="center">
  <img src="Static/roll_call_preview.gif" alt="animated" />
</p>

## How to Run
To use this script, open with Python 3:

```bash
python3 roll_call.py <list> <target directory>
```

## Dependencies
- ``os``: Interact with the operating system (file, directory operations).
- ``sys``: Access system-specific parameters and functions (arguments, exit).

<br><br><br><br>

