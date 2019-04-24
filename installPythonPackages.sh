### Python setup ###

# python2 and python3 come installed by default with Ubuntu

# install pip
sudo apt install python3-pip

# upgrade pip to latest version
pip3 install --upgrade pip

# install python3-tk (dunno why this doesn't come with Ubuntu by default)
sudo apt-get install python3-tk

# install my favourite packages
# note the use of 'pip3' (which is applicable to python3)
# rather than 'pip' (which is applicable to python2)

# IDE
pip3 install jupyter --user

# data manipulation
pip3 install pandas

# data visualization
pip3 install ggplot --user
pip3 install missingno --user

# machine learning
pip3 install sklearn --user

# big data
pip3 install dask[complete] --user
