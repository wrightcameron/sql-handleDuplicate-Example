
build:
	docker-compose up -d
	psql -U postgres -h localhost -f ./setup/schema.sql
	psql -U postgres -h localhost -f ./functions/sprocAddSensor.sql
	psql -U postgres -h localhost -f ./setup/data.sql

clean:
	docker stop postgres
