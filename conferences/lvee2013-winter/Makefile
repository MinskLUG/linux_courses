
all: corporate_linux_education.pdf

OUTDIR=out
DEPENDS=problem-description.tex \
	epam.tex \
	sam-solutions.tex \
	collaborative-work.tex

%.pdf: %.tex $(OUTDIR) common.tex $(DEPENDS)
	xelatex -mktex=pk -output-directory=$(OUTDIR) -output-format=pdf $<
	xelatex -mktex=pk -output-directory=$(OUTDIR) -output-format=pdf $<
	cp -v "$(OUTDIR)/$@" .

$(OUTDIR):
	mkdir -pv $(OUTDIR)

clean: 
	rm -rvf $(OUTDIR)
