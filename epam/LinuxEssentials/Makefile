TARGET = 01-intro.pdf
TARGET += 02-command_line_intro.pdf
TARGET += 03-bash_and_process.pdf
TARGET += 04-commands.pdf
TARGET += 05-sed_rpm.pdf
TARGET += 06-users.pdf
TARGET += 07-networking.pdf
TARGET += 08-disk.pdf
TARGET += LinuxEssentialsHandbook.pdf

LATEXML=latexml
LATEXML_PARAMS=--inputencoding=utf8 --preload=beamer.cls --preload=t2aenc.def --nocomments
XMLWF=xmlwf
XMLWF_PARAMS=

LATEXML2OPENXML=java -jar latexml2openxml-0.0.1-SNAPSHOT-jar-with-dependencies.jar

.PHONY: all xml pptx tex clean

%.pdf: %.tex
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<

%.xml: %.tex
	$(LATEXML) $(LATEXML_PARAMS) --destination=$@ $< &> $@.log
	$(XMLWF) $(XMLWF_PARAMS) $@

%.pptx: %.xml
	$(LATEXML2OPENXML) --slideshow=$@ $< &> $@.log

tex: $(TARGET)

xml: $(TARGET_XML)

pptx: $(TARGET_PPTX)

bib: programm.aux
	bibtex8 -s programm.aux

all: tex

clean: 
	@rm -f *.aux
	@rm -f *.vrb
	@rm -f *.snm
	@rm -f *.log
	@rm -f *.out
	@rm -f *.toc
	@rm -f *.nav
	@rm -f $(TARGET_PPTX)
	@rm -f $(TARGET_XML)
	@rm -f $(TARGET)
