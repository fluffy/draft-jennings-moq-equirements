
# install xml2rfc with "pip install xml2rfc"
# install mmark from https://github.com/mmarkdown/mmark 
# install pandoc from https://pandoc.org/installing.html
# install lib/rr.war from https://bottlecaps.de/rr/ui or https://github.com/GuntherRademacher/rr

.PHONE: all clean lint format

all: gen/draft-jennings-moq-requirements.txt

clean:
	rm -rf gen/*

lint: gen/draft-jennings-moq-requirements.xml
	rfclint gen/draft-jennings-moq-requirements.xml

format:
	mkdir -p gen
	mmark  moq-reqs.md >  gen/moq-reqs.md
	echo updated MD is in  gen/moq-reqs.md

gen/draft-jennings-moq-requirements.xml: rfc.md abstract.md  moq-reqs.md contributors.md
	mkdir -p gen
	mmark  rfc.md > gen/draft-jennings-moq-requirements.xml

gen/draft-jennings-moq-requirements.txt: gen/draft-jennings-moq-requirements.xml
	xml2rfc --text --v3 gen/draft-jennings-moq-requirements.xml

gen/draft-jennings-moq-requirements.pdf: gen/draft-jennings-moq-requirements.xml
	xml2rfc --pdf --v3 gen/draft-jennings-moq-requirements.xml

gen/draft-jennings-moq-requirements.html: gen/draft-jennings-moq-requirements.xml
	xml2rfc --html --v3 gen/draft-jennings-moq-requirements.xml

gen/moq-reqs.pdf: abstract.md  moq-reqs.md contributors.md 
	mkdir -p gen 
	pandoc -s title.md abstract.md  moq-reqs.md contributors.md -o gen/moq-reqspdf

