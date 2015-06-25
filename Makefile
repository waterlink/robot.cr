O := bin
SOURCES := $(shell find src -name '*.cr')
SOURCES := $(shell find spec -name '*.cr')
CR := crystal build
CRSPEC := crystal spec

all: robot

robot: $(SOURCES)
	@mkdir -p $(O)
	$(CR) -o $(O)/robot src/binary.cr

test: $(SOURCES) $(SPEC_SOURCES)
	$(CRSPEC)

clean:
	rm -rf $(0)
	rm -rf .crystal
