# retropie setup scripts

## Features

- setting up kintarosnes for tinkerboard https://github.com/monofuel/KintaroSnes
- setup syncing to nfs share
  - script checks that nfs is mounted
  - bi-directional sync
  - ran once every minute, will abort if already running
- TODO finish automating retropie script
- TODO openvpn for accessing nfs
- TODO automate wifi setup
- TODO autoamte trusting bluetooth devices

## PIGRRL 2

TODO

## PIGRRL ZERO

TODO

## TINKERBOARD S

- image creation setup, and provisioning with ansdible after flashing is setup
- TODO: setup image with ansible automatically

- EMMC instructions https://tinkerboarding.co.uk/wiki/index.php/Setup

- if you have docker, run `make monosnes`
- if you have vagrant:
  - I setup the vagrant image to use docker (see https://github.com/armbian/build/issues/751 )
  - `vagrant up`
  - `vagrant ssh`
  - `cd /vagrant`
  - `make monosnes`
  - use etcher or dd to flash `monosnes/build/output/images/*.img`

- setup with ansible:
  - ssh in as root (pass 1234) and change the hostname to `monosnes`
  - add the ansible user
  - give ansible access to sudo without password
  - flash to EMMC and mount sd card at /home/retropie

- EMMC defaults to UMS u-boot for flashing to the EMMC from a PC
  - flash u-boot to sd-card for recovering from EMMC
  - https://github.com/TinkerBoard/debian_u-boot/releases
  - partition rest of u-boot sd card to use as home partition

### notes

- https://tinkerboarding.co.uk/wiki/index.php?title=HDMI-resolution