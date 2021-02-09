BUGS=bee beetle grasshopper spider ant butterfly

all: templates inserts tiles

templates:
	openscad -o insert.png --render -D ''insert=\"\"'' insert.scad ; \
	convert insert.png -transparent "#ffffe5" -trim insert.png ; \
	openscad -o tile.png --render -D ''tile=\"\"'' tile.scad ; \
	convert tile.png -transparent "#ffffe5" -trim tile.png ; \

inserts:
	for f in ${BUGS}; do \
		openscad -o $$f-insert.stl -D ''insert=\"$$f-insert\"'' insert.scad ; \
		openscad -o $$f-insert.png --render -D ''insert=\"$$f-insert\"'' insert.scad ; \
		convert $$f-insert.png -transparent "#ffffe5" -trim $$f-insert.png ; \
	done

tiles:
	for f in ${BUGS}; do \
	 	openscad -o $$f-tile.stl -D ''tile=\"$$f-tile\"'' tile.scad ; \
		openscad -o $$f-tile.png --render -D ''tile=\"$$f-tile\"'' tile.scad ; \
		convert $$f-tile.png -transparent "#ffffe5" -trim $$f-tile.png ; \
	done

logo:
	openscad -o logo.svg logo.scad
