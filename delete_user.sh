#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "This script must be run as root" 1>&2
    exit 1
fi

# Ask user for the username to delete
read -p "Enter the username to delete: " username

# Check if the user exists
if ! id "$username" &>/dev/null; then
    echo "User $username does not exist."
    exit 1
fi

# Confirm with the user before deletion
read -p "Are you sure you want to delete user $username and its home directory? [y/N]: " confirm
if [ "$confirm" != "y" ] && [ "$confirm" != "Y" ]; then
    echo "User deletion cancelled."
    exit 0
fi

# Delete the user and its home directory
userdel -r "$username"

# Check if user deletion was successful
if [ $? -eq 0 ]; then
    echo "User $username and its home directory deleted successfully."
else
    echo "Failed to delete user $username."
fi

# Send user information via email
TO="omkarsalunkhe1211@gmail.com"

# Get current date and time
CURRENT_DATE_TIME=$(date +"%d-%m-%Y %I:%M:%S %p")

echo -e "User $username and its home directory deleted successfully.\nTime & Date: $CURRENT_DATE_TIME\n\n**********THANK YOU**********" | mail -s "USER DELETE ALERT!" "${TO}"