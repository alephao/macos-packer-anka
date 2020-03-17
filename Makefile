.PHONY: install-anka
install-anka:
	curl -L -o Anka.pkg https://veertu.com/downloads/ankabuild-latest
	sudo installer -pkg Anka.pkg -tgt /

.PHONY: install-packer
install-packer:
	curl -L -o packer_1.4.5_darwin_amd64.zip https://releases.hashicorp.com/packer/1.4.5/packer_1.4.5_darwin_amd64.zip
	unzip packer_1.4.5_darwin_amd64.zip
	mv packer /usr/local/bin
	rm packer_1.4.5_darwin_amd64.zip
	@echo "Installed packer on /usr/local/bin/"
	packer version

.PHONY: install-packer-anka-plugin
install-packer-anka-plugin:
	mkdir packer-anka-plugin
	curl -L -o packer-anka-plugin/packer-builder-veertu-anka_1.1.0_darwin_amd64.tar.gz https://github.com/veertuinc/packer-builder-veertu-anka/releases/download/v1.1.0/packer-builder-veertu-anka_1.1.0_darwin_amd64.tar.gz
	tar -xvzf packer-anka-plugin/packer-builder-veertu-anka_1.1.0_darwin_amd64.tar.gz -C packer-anka-plugin
	mv packer-anka-plugin/packer-builder-veertu-anka ~/.packer.d/plugins/