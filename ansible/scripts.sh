# ping hosts
ansible all -m ping -i ./hosts

#update pacman
ansible-playbook -i ./hosts update-pacman.yml