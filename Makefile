.PHONY = all

stl_dir = STL

all: $(stl_dir)/base.stl

$(stl_dir)/%.stl: %.scad
	openscad -o $@ $<
