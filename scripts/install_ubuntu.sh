#!/usr/bin/sh

wget http://repo.continuum.io/miniconda/Miniconda3-4.0.5-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p /home/$USER/miniconda
export PATH=$PATH:/home/$USER/miniconda/bin
chown vagrant /home/$USER/miniconda
echo "export PATH=$PATH:/home/$USER/miniconda/bin" >> /etc/profile
echo "export PATH=$PATH:/home/$USER/miniconda/bin" >> /etc/environment

alias python=/home/$USER/miniconda/bin/python3.5
echo "alias python=/home/$USER/miniconda/bin/python3.5" >> /etc/profile

conda create -n tensorflow python=3.5 -y
source activate tensorflow
conda install anaconda -y 
conda install -c https://conda.anaconda.org/anaconda pydot
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp27-none-linux_x86_64.whl
pip install rodeo
