# -*- mode: ruby -*-
# vi: set ft=ruby :


default_opts = {
  "memory" => "4096",
  "cpus" => "2",
  "gui" => true
}

if File.file?('boxes.yaml')
  require 'yaml'
  boxes = YAML.load_file(File.join(File.dirname(__FILE__), 'boxes.yaml'))
else
  boxes = [{name: 'default'}]
end


Vagrant.configure("2") do |config|

  boxes.each do |machine|
    machine = default_opts.merge(machine)

    config.vm.define machine["name"] do |node|
      config.vm.box = "archlinux/archlinux"

      config.vm.synced_folder "src/", "/home/vagrant/hackistan/"

      config.vm.provision "bootstrap", type: "shell", run: "once", inline: "/home/vagrant/hackistan/provisioners/bootstrap.sh"
      config.vm.provision "bootstrap", type: "shell", run: "always", inline: "/home/vagrant/hackistan/provisioners/install_default.sh"
      config.vm.provision "bootstrap_user", type: "shell", run: "always", privileged: false, inline: "/home/vagrant/hackistan/provisioners/bootstrap_user.sh"

      config.vm.provision "aur", type: "shell", run: "always", privileged: false, inline: "/home/vagrant/hackistan/provisioners/install_aur.sh"
      config.vm.provision "blackarch", type: "shell", run: "always", inline: "/home/vagrant/hackistan/provisioners/install_blackarch.sh"

      config.vm.provision "desktop", type: "shell", run: "always", privileged: false, inline: "/home/vagrant/hackistan/provisioners/install_desktop.sh"
      config.vm.provision "hackistan", type: "shell", run: "always", privileged: false, inline: "/home/vagrant/hackistan/provisioners/install_hackistan.sh"

      # config.vm.provision :shell, path: "setup/update.sh", run: "always"
      config.ssh.forward_x11 = true
      config.ssh.forward_agent = true

      config.vm.provider "virtualbox" do |vb|
        vb.gui = machine["gui"]
        # vb.name = machine_name
        vb.memory = machine["memory"]
        vb.customize ["modifyvm", :id, "--monitorcount", "1"]

        # EFI boot
        # vb.customize ["modifyvm", :id, "--firmware", "efi64"]

        # disable audio
        # vb.customize ["modifyvm", :id, "--audio", "none"]

        # better video
        vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
        vb.customize ["modifyvm", :id, "--vram", "256"]

        # integration with desktop
        vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
        vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]

        vb.customize ["modifyvm", :id, "--cpus", machine["cpus"]]
      end
    end
  end
end
