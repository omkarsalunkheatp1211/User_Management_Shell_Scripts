# User Management Scripts

This repository contains two bash scripts for user management on a Linux system.

## Table of Contents

- [user_make.sh](#user_make.sh)
  - [Introduction](#introduction)
  - [Features](#features)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  -  [Usage](#usage)
- [delete_user.sh](#delete_user.sh)
  - [Introduction](#introduction-1)
  - [Features](#features-1)
  - [Prerequisites](#prerequisites-1)
  - [Usage](#usage-1)

## user_make.sh

### Introduction

The `user_make.sh` script automates the process of creating user accounts on a Linux system.

### Features

- Root access check.
- User input for username.
- Random password generation.
- User account creation.
- Password setting.
- Email notification with user information.

### Prerequisites

- Bash shell
- OpenSSL

### Installation

1. Clone the repository to your local machine.
2. Ensure execute permissions for the script (`chmod +x user_make.sh`).
3. Make sure OpenSSL is installed (`sudo apt install openssl` on Debian-based systems).

#### Usage

1. Open a terminal.
2. Navigate to the directory containing the `user_make.sh` script.
3. Run the script with root privileges: `sudo ./user_make.sh`.
4. Follow the prompts to enter the username when prompted.

## delete_user.sh

### Introduction

The `delete_user.sh` script allows the removal of user accounts from a Linux system.

### Features

- Root access check.
- User existence validation.
- Confirmation prompt before deletion.
- Removal of user and home directory.
- Email notification upon successful deletion.

### Prerequisites

- Bash shell

### Usage

1. Run the script as root: `sudo ./delete_user.sh`.
2. Enter the username to be deleted when prompted.
3. Confirm deletion when prompted.
