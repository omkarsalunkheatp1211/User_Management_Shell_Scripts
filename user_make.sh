#!/bin/bash

# Check for root access
if [ "${UID}" -ne 0 ]; then
    echo 'Please run with sudo or root.'
    exit 1
fi

# Ask user to input username
read -p "Enter a user name: " USER_NAME

# Generate a random password
PASSWORD=$(openssl rand -base64 12)

# Create a user with comment
useradd -m -s /bin/bash ${USER_NAME}

# Check if user was created successfully
if [ $? -ne 0 ]; then
    echo "The account could not be created"
    exit 1
fi

# Set the password for the user
echo "${USER_NAME}:${PASSWORD}" | chpasswd

# Check if password was set successfully
if [ $? -ne 0 ]; then
    echo "Password could not be set"
    exit 1
fi

# Display user information
echo
echo "Username: ${USER_NAME}"
echo
echo "Password: ${PASSWORD}"
echo
echo "Hostname: $(hostname -f)"

# Send user information via email
TO="omkarsalunkhe1211@gmail.com"

# Get current date and time
CURRENT_DATE_TIME=$(date +"%d-%m-%Y %I:%M:%S %p")

echo
echo -e "Successfully created user account on RHELVM2 machine\n\nUsername: ${USER_NAME}\nPassword: ${PASSWORD}\nHostname: $(hostname -f)\nTime & Date: $CURRENT_DATE_TIME\n\n**********THANK YOU**********" | mail -s "NEW USER CREATED" "${TO}"

echo "User account created successfully."