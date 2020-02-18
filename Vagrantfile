# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Vagrantfile for testing vagrant-alpine
#

Vagrant.configure(2) do |config|

  config.vm.box = 'maier/alpine-3.1.3-x86_64'

  config.ssh.username = 'vagrant'
  config.ssh.password = 'vagrant'
  config.ssh.shell = '/bin/sh'

  #
  # Networking
  #
  # DHCP
   config.vm.network 'private_network', type: 'dhcp'
  #
  # Static (replace <IP> with an appropriate private address)
  # config.vm.network 'private_network', ip: '<IP>', auto_config: true

  #
  # Shared folders
  #
  # Note, for shared folders via NFS a static IP *must* be provided
  # until guest additions can be built and installed out of main.
  # The reason being that although a DHCP interface does successfully
  # get an IP, virtualbox is unaware of it and therefore cannot
  # provide it to Vagrant.
  #
  # If not assigning a static IP, ensure the default
  # share is disabled.
  config.vm.synced_folder '.', '/vagrant', disabled: true
  #
  # Define NFS shares (comment out above when enabling
  # this 'default' folder, or mount a different folder.)
  # config.vm.synced_folder '.', '/vagrant', type: 'nfs'

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'vagrant-alpine-test'
    vb.cpus = 1
    vb.memory = 1024
    # vb.gui = true
  end

  # Enabling provisioning - run shell script to upate
  # installed alpine.
  # config.vm.provision 'shell', inline: <<-SHELL
  #   apk update && apk upgrade
  # SHELL

end
