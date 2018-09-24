
.PHONY: monosnes
monosnes:
	cd monosnes/build && ./compile.sh docker

.PHONY: check
check:
	ansible-playbook --syntax-check $(wildcard playbooks/*.yml)