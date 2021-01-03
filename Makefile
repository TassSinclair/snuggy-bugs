pieces:
	for f in bee beetle; do \
		openscad -o $$f.stl -D ''bug=\"$$f\"'' bug.scad ; \
	 	openscad -o $$f-tile.stl -D ''tile=\"$$f-tile\"'' tile.scad ; \
	done

logo:
	openscad -o logo.svg logo.scad