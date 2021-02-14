BUGS=bee beetle grasshopper spider ant butterfly

all: templates build-all slice-all enqueue-all

build: build-insert build-tile

build-all:
	for f in ${BUGS}; do \
		BUG=$$f make build-insert ; \
		BUG=$$f make build-tile ; \
	done

build-insert:
	openscad -o $$BUG-insert.stl -D ''insert=\"$$BUG-insert\"'' insert.scad
	openscad -o $$BUG-insert.png --render -D ''insert=\"$$BUG-insert\"'' insert.scad
	convert $$BUG-insert.png -transparent "#ffffe5" -trim $$BUG-insert.png

build-tile:
	openscad -o $$BUG-tile.stl -D ''tile=\"$$BUG-tile\"'' tile.scad
	openscad -o $$BUG-tile.png --render -D ''tile=\"$$BUG-tile\"'' tile.scad
	convert $$BUG-tile.png -transparent "#ffffe5" -trim $$BUG-tile.png 

slice: slice-tile slice-insert

slice-all: 
	for f in ${BUGS}; do \
		BUG=$$f make slice-insert ; \
		BUG=$$f make slice-tile ; \
	done

slice-tile:
	/Applications/Ultimaker\ Cura.app/Contents/MacOS/CuraEngine slice \
		$(shell cat cura-options.txt) \
		-l $$BUG-tile.stl -o $$BUG-tile.gcode

slice-insert:
	/Applications/Ultimaker\ Cura.app/Contents/MacOS/CuraEngine slice \
		$(shell cat cura-options.txt) \
		-l $$BUG-insert.stl -o $$BUG-insert.gcode

enqueue: enqueue-tile enqueue-insert

enqueue-all:
	for f in ${BUGS}; do \
		BUG=$$f make enqueue-insert ; \
		BUG=$$f make enqueue-tile ; \
	done

enqueue-tile:
	curl --request POST \
		--url http://octopi.local/api/files/local \
		--header 'Content-Type: multipart/form-data' \
		--header 'X-Api-Key: ${OCTOPRINT_API_KEY}' \
		--header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
		--form file="@$$BUG-tile.gcode" \
		--form select=true \
		--form print=false | jq -r ".files.local.refs.resource"

enqueue-insert:
	curl --request POST \
		--url http://octopi.local/api/files/local \
		--header 'Content-Type: multipart/form-data' \
		--header 'X-Api-Key: ${OCTOPRINT_API_KEY}' \
		--header 'content-type: multipart/form-data; boundary=---011000010111000001101001' \
		--form file="@$$BUG-insert.gcode" \
		--form select=true \
		--form print=false | jq -r ".files.local.refs.resource"

templates:
	openscad -o insert.png --render -D ''insert=\"\"'' insert.scad ; \
	convert insert.png -transparent "#ffffe5" -trim insert.png ; \
	openscad -o tile.png --render -D ''tile=\"\"'' tile.scad ; \
	convert tile.png -transparent "#ffffe5" -trim tile.png ; \

logo:
	openscad -o logo.svg logo.scad