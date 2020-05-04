#!/bin/bash
# (C) 2020 Benjamin Steenkamer.
# Fetch and update packages; then remove old packages.
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoclean
sudo apt-get autoremove
