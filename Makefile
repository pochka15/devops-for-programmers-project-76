VAULT_HOSTS ?= all

install_roles:
	ansible-galaxy install -r requirements.yml

vault_encrypt:
	ansible-vault encrypt group_vars/$(VAULT_HOSTS)/vault.yml  --vault-password-file vault-password.txt

vault_edit:
	ansible-vault edit group_vars/$(VAULT_HOSTS)/vault.yml --vault-password-file vault-password.txt

vault_view:
	ansible-vault view group_vars/$(VAULT_HOSTS)/vault.yml --vault-password-file vault-password.txt

ssh:
	ssh `yq e '.all.children.webservers.hosts.web1.ansible_host' inventory.yml`

# Deployment

setup:
	ansible-playbook setup.yml -i inventory.yml --vault-password-file vault-password.txt

setup_monitoring:
	ansible-playbook setup_monitoring.yml -i inventory.yml --vault-password-file vault-password.txt

release:
	ansible-playbook playbook.yml -i inventory.yml --vault-password-file vault-password.txt
