#!/bin/bash
# (C) 2024 Benjamin Steenkamer
# Prints basic details of Debian distro:
# Debian major.minor, codename, and architecture
# Kernel version and release date
# Current up time and start time

os_release=$(cat /etc/os-release)
name=$(awk -F= '/^NAME=/ {print $2}' <<< $os_release | tr -d '"')
codename=$(awk -F= '/^VERSION_CODENAME=/ {print $2}' <<< $os_release)

version=$(cat /etc/debian_version)

echo "$name $version ($codename)" $(uname -m)
uname -srv
echo $(uptime -p) \($(uptime -s)\)
