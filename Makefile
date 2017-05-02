#!/usr/bin/make -f

adocs = $(wildcard doc/*.adoc)
htmls = $(adocs:.adoc=.html)
pdfs  = $(adocs:.adoc=.pdf)

all: doc
doc: html pdf

html: ${htmls}
pdf: ${pdfs}

clean:
	rm -rf doc/*.html doc/*.png doc/*.cache doc/*.pdf doc/.asciidoctor

%.html: %.adoc
	asciidoctor -r asciidoctor-diagram -b html5 -o $@ $<

%.pdf: %.adoc $(wildcard doc/media/*.*)
	asciidoctor-pdf -r asciidoctor-diagram -o $@ $<

# EOF
