Vagrant.configure(2) do |config|
  config.vm.box = "hashicorp/bionic64"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = true
  end

  # Install git and pull repo
  config.vm.provision "shell", inline: "sudo apt-get update && sudo apt-get install git"
  config.vm.provision "shell", inline: "git clone https://github.com/tinoschroeter/dotfiles.git"
end
