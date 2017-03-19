.PHONY = all

stl_dir := STL
STLS := $(patsubst %.scad,$(stl_dir)/%.stl,$(wildcard *.scad))

all: $(STLS)

$(stl_dir)/%.stl: %.scad
	openscad -o $@ $<
