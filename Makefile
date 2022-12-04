
build:
	docker-compose up -d && sleep 5s
	./setup.sh
clean:
	docker-compose down
