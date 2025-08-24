infra:
	git pull
	terraform init
	terraform apply -auto-approve

ansible:
	git pull
	ansible-playbook -i $(tool_name)-int.prashumps.online, -e ansible_user=azuser -e ansible_password=Devops@123456 tool_setup.yml -e tool_name=$(tool_name) -e token=$(token)