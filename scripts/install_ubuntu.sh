#!/usr/bin/sh

wget http://repo.continuum.io/miniconda/Miniconda3-4.0.5-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p /home/vagrant/miniconda
export PATH=$PATH:/home/vagrant/miniconda/bin
chown vagrant /home/vagrant/miniconda
echo "export PATH=$PATH:/home/vagrant/miniconda/bin" >> /etc/profile
echo "export PATH=$PATH:/home/vagrant/miniconda/bin" >> /etc/environment
conda create -n tensorflow python=3.5 -y
alias python=/home/vagrant/miniconda/bin/python3.5
echo "alias python=/home/vagrant/miniconda/bin/python3.5" >> /etc/profile
source activate tensorflow
apt-get install libtool-bin autoconf cmake -y
git clone https://github.com/zeromq/libzmq && cd libzmq
mkdir cmake-build && cd cmake-build
cmake .. && make -j 4
make install && sudo ldconfig
rm -rf cd libzmq
apt-get install python-pip python3-pip python-dev python-zmq -y
pip install pyzmq
conda install anaconda -y 
conda install -c https://conda.anaconda.org/anaconda pydot
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp27-none-linux_x86_64.whl
pip install rodeo
chown vagrant /home/vagrant/miniconda
