# -*- mode: ruby -*-
# vi: set ft=ruby :

$script = <<-SCRIPT
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
conda install anaconda -y 
conda install -c https://conda.anaconda.org/anaconda pydot
pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/tensorflow-0.8.0rc0-cp27-none-linux_x86_64.whl
pip install rodeo
chown vagrant /home/vagrant/miniconda
SCRIPT

$startup = <<-SCRIPT
source activate tensorflow 
ipython notebook --no-browser --port=8001 --ip=0.0.0.0 --notebook-dir=/home/vagrant/home/ &
rodeo /home/vagrant/home/ --host=0.0.0.0 --no-browser --port=5001 &
SCRIPT

Vagrant.configure(2) do |config|
  config.ssh.insert_key = false
  config.vm.box = "larryli/vivid64"
  config.ssh.forward_x11 = false
  config.vm.box_check_update = true
  config.vm.provider "virtualbox" do |vb|
    vb.memory = "2048"
    vb.name = "google-ml-vivid"
  end
  config.vm.hostname = "google-ml-vivid"
  config.vm.network :forwarded_port, host: 8001, guest: 8001, auto_correct: true
  config.vm.network :forwarded_port, host: 5001, guest: 5001, auto_correct: true
  config.vm.usable_port_range = 4040..4090
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.synced_folder "shared/", "/home/vagrant/home/", type:"nfs"
  config.vm.boot_timeout = 900
  config.vm.provision "shell", inline: $script
  config.vm.provision "shell", inline: $startup, run: "always", privileged: false
end
