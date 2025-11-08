#!/bin/bash
# (C) 2024 - 2025 Benjamin Steenkamer
# Prints basic details of Debian-based distro:
# Distro name, version, code name, and architecture
# Debian version and code name
# Kernel version and release date
# Current up time and start time

os_release=$(cat /etc/os-release)
dist_name=$(awk -F= '/^PRETTY_NAME=/ {print $2}' <<< $os_release | tr -d '"')
deb_name=$(awk -F'=' '/DEBIAN_CODENAME/ {print $2}' <<< $os_release)
deb_version=$(awk -F'=' '/DEBIAN_VERSION_FULL/ {print $2}' <<< $os_release)


echo "$dist_name" $(uname -m)
echo "Debian $deb_version ($deb_name)"
uname -srv
echo $(uptime -p) \($(uptime -s)\)
