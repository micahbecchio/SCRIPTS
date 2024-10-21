
# DOWNLOAD AND INSTALL MINICONDA
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh
source ~/miniconda3/bin/activate
conda init

# Add conda-forge and bioconda channels
conda config --add channels conda-forge
conda config --add channels bioconda

# Update conda
conda update conda
