#!/bin/sh
set -e
apt-get -y update
apt-get -y dist-upgrade
apt-get -y autoremove --purge
apt-get -y autoclean
