infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(too_name)-int.prashumps.online, -e ansible_user=azuser -e ansible_password=Devops@123456 tool_setup.yml -e tool_name=$(too_name)