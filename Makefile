O := bin
SOURCES := $(shell find src -name '*.cr')
CR := crystal build

all: robot

robot: $(SOURCES)
	@mkdir -p $(O)
	$(CR) -o $(O)/robot src/robot.cr
