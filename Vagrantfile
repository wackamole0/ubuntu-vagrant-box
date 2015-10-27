VAGRANTFILE_API_VERSION = "2"

BOX      = "ubuntu/trusty64"
URL      = "https://vagrantcloud.com/ubuntu/boxes/trusty64"
RAM      = "512"
VBOX_GUI = true

$script = <<SCRIPT
wget "https://gist.githubusercontent.com/wackamole0/e83e7cb2844fe6491bf4/raw/de875be62c53e1ed829ee33c5bc33f84bd48c5c1/prepare-vagrant-box.sh" -O /etc/prep.sh
chmod u+x /etc/prep.sh
/etc/prep.sh | tee /etc/prep.sh.log
SCRIPT

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = BOX

  config.vm.provider "virtualbox" do |vb|
    vb.gui = VBOX_GUI
    vb.customize ["modifyvm", :id, "--memory", RAM]
  end

  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provision "shell", inline: $script

end
