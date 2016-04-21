#!/usr/bin/sh

apt-get install libtool-bin autoconf cmake -y
git clone https://github.com/zeromq/libzmq && cd libzmq
mkdir cmake-build && cd cmake-build
cmake .. && make -j 4
make install && sudo ldconfig
rm -rf libzmq
apt-get install python-pip python3-pip python-dev python-zmq -y
pip install auxlib
pip install conda
conda upgrade conda
conda upgrade conda-build
conda install anaconda -y 
echo "export PATH=$HOME/anaconda/bin:$PATH" >> .bash_profile﻿
conda install -c https://conda.anaconda.org/anaconda pydot
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp27-none-linux_x86_64.whl
pip install rodeo

ipython notebook --no-browser --port=8001 --ip=0.0.0.0 --notebook-dir=/home/vagrant/home/ &
rodeo /home/vagrant/home/ --host=0.0.0.0 --no-browser --port=5001 &

