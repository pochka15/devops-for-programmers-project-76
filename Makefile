install_roles:
	ansible-galaxy install -r requirements.yml

vault_encrypt:
	ansible-vault encrypt group_vars/webservers/vault.yml  --vault-password-file vault-password.txt

vault_edit:
	ansible-vault edit group_vars/webservers/vault.yml --vault-password-file vault-password.txt

vault_view:
	ansible-vault view group_vars/webservers/vault.yml --vault-password-file vault-password.txt

ssh:
	ssh `yq e '.all.children.webservers.hosts.web1.ansible_host' inventory.yml`

# Deployment

setup_required_packages:
	ansible-playbook setup.yml -i inventory.yml --vault-password-file vault-password.txt --tags required

setup_docker:
	ansible-playbook setup.yml -i inventory.yml --vault-password-file vault-password.txt --tags docker

setup_monitoring:
	ansible-playbook setup.yml -i inventory.yml --vault-password-file vault-password.txt --tags monitoring

setup: setup_required_packages setup_docker setup_monitoring

release:
	ansible-playbook playbook.yml -i inventory.yml --vault-password-file vault-password.txt
