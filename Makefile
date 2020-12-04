CXX = clang++

CXXFLAGS = -Wall -Werror -g
LDFLAGS += -std=c++2a

BIN_NAME = core

default: run

clean:
	rm -f ./$(BIN_NAME)

build: clean
	$(CXX) $(CXXFLAGS) $(LDFLAGS) -o $(BIN_NAME) src/*.cpp
	chmod +x ./$(BIN_NAME)

build-nix:
	nix-shell $(SHELLFLAGS) shell.nix --run 'make build'

run: build
	./$(BIN_NAME) > image.ppm

run-nix: build-nix
	./$(BIN_NAME) > image.ppm

shell:
	nix-shell $(SHELLFLAGS) shell.nix
