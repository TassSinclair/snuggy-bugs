BUGS=bee beetle grasshopper spider ant butterfly

all: bugs tiles

bugs:
	for f in ${BUGS}; do \
		openscad -o $$f.stl -D ''bug=\"$$f\"'' bug.scad ; \
		openscad -o $$f.png --render -D ''bug=\"$$f\"'' bug.scad ; \
		convert $$f.png -transparent "#ffffe5" -trim $$f.png ; \
	done

tiles:
	for f in ${BUGS}; do \
	 	openscad -o $$f-tile.stl -D ''tile=\"$$f-tile\"'' tile.scad ; \
		openscad -o $$f-tile.png --render -D ''tile=\"$$f-tile\"'' tile.scad ; \
		convert $$f-tile.png -transparent "#ffffe5" -trim $$f-tile.png ; \
	done

logo:
	openscad -o logo.svg logo.scad
