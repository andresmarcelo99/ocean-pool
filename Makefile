
BIN_DIR=./bin

.PHONY:build
build:
	@echo "Building project..."
	go build -o $(BIN_DIR)/api ./cmd/api
	go build -o $(BIN_DIR)/oceanpool ./cmd/oceanpool

.PHONY:run
run:
	@echo "Running project..."
	go run ./cmd/api/main.go

.PHONY:test
test:
	@echo "Testing project..."
	go test -race -cover ./...

.PHONY:lint
lint:
	@echo "Linting project..."
	golangci-lint run

.PHONY:clean
clean:
	@echo "Removing build files..."
	rm -rf $(BIN_DIR)