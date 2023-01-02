release:
	ansible-playbook ansible/release.yml -i ansible/inventory.yml 

ssh:
	ssh `yq e '.all.children.webservers.hosts.web1.ansible_host' ansible/inventory.yml`
