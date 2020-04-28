#!/bin/bash
# Benjamin Steenkamer, 2020.
# Fetch and update packages; then remove old packages.
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoclean
sudo apt-get autoremove
