install_roles:
	ansible-galaxy install -r ../requirements.yml

encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml

ssh:
	ssh `yq e '.all.children.webservers.hosts.web1.ansible_host' inventory.yml`

# Deployment

setup:
	ansible-playbook setup.yml -i inventory.yml --ask-vault-pass

setup_monitoring:
	ansible-playbook setup_monitoring.yml -i inventory.yml --ask-vault-pass

release:
	ansible-playbook release.yml -i inventory.yml --ask-vault-pass
