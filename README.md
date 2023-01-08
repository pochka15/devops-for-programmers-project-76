# Redmine deployment using Ansible

[![Actions Status](https://github.com/pochka15/devops-for-programmers-project-76/workflows/hexlet-check/badge.svg)](https://github.com/pochka15/devops-for-programmers-project-76/actions)

## About

This is another DevOps project for the Hexlet course. It deploys a [Redmine](https://hub.docker.com/_/redmine) App

## Deployment tutorial

### Step 1: create virtual machines and accounts

- You need to have any of these OS on your machine: Ubuntu, MacOs, Windows (needs to be tested)
- Create VM in the Cloud e.x. in "Digital ocean"
- Create a Postgres DB instance e.x. in "railway.app"
- Create the DataDog account

### Step 2: Prepare for the deployment

- Install [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) on your machine
- Setup cloud VM addresses in the [Inveontory](./inventory.yml)
- Setup ssh keys: edit the `~/.ssh/config`
- Setup environment
  - Set common variables [vars.yml](./group_vars/all/vars.yml)
  - Same for the [webservers](./group_vars/webservers) and setup secrets in the [vault.yml](./group_vars/all/vault.yml)
  - Create a password in the `<project-root>/vault-password.txt`. It's added to the `.gitignore`. It's necessary to encrypt secrets
  - Encrypt secrets: `make vault_encrypt`.

### Step 3: Deploy
  
See the [Makefile](./Makefile) for all available commands

Example: `make install_roles setup release`

## Links

- [Deployed app](https://pochka15.click/)

## Images

See the "images" directory