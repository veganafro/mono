.PHONY: build clean deepclean logs proto start status stop

build: # Build docker image
	docker-compose build

clean:stop # Stop docker containers, clean data and workspace
	docker-compose down -v --remove-orphans

deepclean: # Deep clean local docker
	docker container prune -f
	docker image prune -a -f
	docker volume prune -f

logs: # Get logs of containers
	docker-compose logs -f

proto: # Generate proto files
	protoc --proto_path=$(GOPATH)/pkg/mod/github.com/googleapis/googleapis@v0.0.0-20200814034631-3a54e988edcb --proto_path=server/cmd/$(SERVICE)/idl \
		server/cmd/$(SERVICE)/idl/$(PROTO) --go_out=plugins=grpc:server/pkg --go_opt=module=github.com/veganafro/mono

start: # Start docker containers
	docker-compose up -d

status: # Get status of containers
	docker-compose ps

stop: # Stop docker containers
	docker-compose stop

