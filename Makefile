BUILD = output
BOOKNAME = projectname

all: book

book: pdf

clean:
	rm -r $(BUILD)

pdf: $(BUILD)/pdf/$(BOOKNAME).pdf

$(BUILD)/pdf/$(BOOKNAME).pdf: ./core/*.md
	mkdir -p $(BUILD)/pdf
	pandoc -s -o $@ --data-dir=./ --filter pandoc-crossref --filter pandoc-citeproc --pdf-engine=xelatex --top-level-division=chapter --number-sections --template ./controls/arabica.latex ./settings/*.yaml ./metadata/*.yaml $^

.PHONY: all book clean pdf
