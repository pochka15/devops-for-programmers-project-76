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
  - Copy [Example vault](./group_vars/webservers/example_vault.yml) into the [Actual vault](./group_vars/webservers/vault.yml)
  - Edit the [Actual vault](./group_vars/webservers/vault.yml)
  - Encrypt secrets: `cd ansible && make encrypt` and don't forget to store your password somewhere

### Step 3: Deploy
  
See the [Makefile](./Makefile) for all available commands

Example:

```txt
cd ansible
make install_roles setup setup_monitoring release
```

## Links

- [Deployed app](https://pochka15.click/)

## Images

See the "images" directory