#!/usr/bin/make -f

adocs = $(wildcard doc/*.adoc)
htmls = $(adocs:.adoc=.html)
dots  = $(shell find doc -name '*.dot')
pngs  = $(dots:.dot=.png)
pdfs  = $(adocs:.adoc=.pdf)

all: doc
doc: html pdf png

html: ${htmls}
pdf: ${pdfs}
png: ${pngs}

clean:
	rm -f doc/*.html doc/*.png doc/*.cache doc/*.pdf ${pngs}
	rm -rf doc/.asciidoctor

%.html: %.adoc
	asciidoctor -r asciidoctor-diagram -b html5 -o $@ $<

%.pdf: %.adoc $(wildcard doc/media/*.*)
	asciidoctor-pdf -r asciidoctor-diagram -o $@ $<

%.png: %.dot
	dot $< -Tpng -o $@

# EOF
