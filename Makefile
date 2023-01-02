release:
	ansible-playbook ansible/release.yml -i ansible/inventory.yml --ask-vault-pass

ssh:
	ssh `yq e '.all.children.webservers.hosts.web1.ansible_host' ansible/inventory.yml`
