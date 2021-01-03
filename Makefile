pieces:
	for f in bee beetle; do \
		openscad -o $$f.stl -D ''bug=\"$$f\"'' bug.scad ; \
		openscad -o $$f.png --render -D ''bug=\"$$f\"'' bug.scad ; \
	 	openscad -o $$f-tile.stl -D ''tile=\"$$f-tile\"'' tile.scad ; \
		openscad -o $$f-tile.png --render -D ''tile=\"$$f-tile\"'' tile.scad ; \
	done

logo:
	openscad -o logo.svg logo.scad