all: up
prepare: 
	@echo "\n-----------------checking for depedencies------------------\n"
	@sudo apt install -y docker.io
	@sudo systemctl enable --now docker
up: prepare
	@echo "\n------------------starting your container------------------\n"
	@#! /bin/bash
	@if [ ! -d docker ]; then\
		mkdir docker;\
		if [ ! -d www ]; then\
			cd docker ;\
			mkdir www && cd ../../ ;\
		fi ;\
	fi
	@sudo cp ./index.php ./docker/www/;
	@sudo docker-compose up -d
	@echo "\n------------------wating for 20 seconds--------------------\n"
	#@sleep 20
teardown: down
	@echo "\n------------------removing your files----------------------\n"
	@sudo rm -rf ./docker
down:
	@echo "\n------------------stoping all services---------------------\n"
	@sudo docker-compose down