HEADER_SOURCE := xthead.adoc
PDF_RESULT := xthead-spec.pdf

all: build

build:

	@echo "Building asciidoc"
	asciidoctor-pdf \
    --attribute=mathematical-format=svg \
    --attribute=pdf-fontsdir=resources/fonts \
    --attribute=pdf-style=resources/themes/thead-pdf.yml \
    --failure-level=ERROR \
    --require=asciidoctor-diagram \
    --require=asciidoctor-mathematical \
    --out-file=$(PDF_RESULT) \
    $(HEADER_SOURCE)

clean:
	rm -f $(PDF_RESULT)
