
HTML=README.html Linux_QA_program.html
PDF=01_Intro_to_linux.pdf
OUTDIR=out
COMMON=linux-qa-common.tex

all: $(HTML) $(PDF)

%.html: %.md
	markdown $< >$@

%.pdf: %.tex $(OUTDIR) $(COMMON) clipart/*.png
	pdflatex -output-directory=$(OUTDIR) -output-format=pdf $<
	pdflatex -output-directory=$(OUTDIR) -output-format=pdf $<
	cp -v "$(OUTDIR)/$@" .

$(OUTDIR):
	mkdir -pv $(OUTDIR)

clean: 
	rm -rvf $(HTML) $(OUTDIR)
