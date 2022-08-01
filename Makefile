SPEC=xthead
HEADER_SOURCE := $(SPEC).adoc
GITVER=$(shell git describe --tag --always --dirty)
GITDATE=$(shell git show -s --format=%ci | cut -d ' ' -f 1)

# e.g. "2022-07-29-d027732", or "2022-08-01-dbd4007-dirty"
VERSION="$(GITDATE)-$(GITVER)"

$(SPEC)-$(VERSION).pdf: *.adoc
	@echo "Building asciidoc"
	asciidoctor-pdf \
		--attribute=mathematical-format=svg \
		--attribute=pdf-fontsdir=resources/fonts \
		--attribute=pdf-style=resources/themes/thead-pdf.yml \
		--failure-level=ERROR \
		--require=asciidoctor-diagram \
		--require=asciidoctor-mathematical \
		--out-file=$@ \
		$(HEADER_SOURCE)

all: $(SPEC)-$(VERSION).pdf

clean:
	rm -f $(SPEC)-*.pdf
