# ============================================================
# Makefile for europasscv2025 LaTeX class
# ============================================================
# Supports: pdflatex, xelatex, lualatex

TEXENGINE ?= xelatex

europass_logo.pdf: europass_logo.svg
	inkscape $< --export-area-drawing --export-type="pdf" --export-filename="$@"

europasscv2025_en.pdf: europasscv2025_en.tex europasscv2025.cls
	@$(TEXENGINE) europasscv2025_en.tex
	@$(TEXENGINE) europasscv2025_en.tex

europasscv2025_bib_en.pdf: europasscv2025_bib_en.tex europasscv2025.cls europasscv2025-bibliography.sty
	latekmk -$(TEXENGINE) -biber europasscv2025_bib_en.tex
	latekmk -$(TEXENGINE) -biber europasscv2025_bib_en.tex

distclean:
	rm -f *~ *.synctex.gz *.aux *.log *.out *.backup *.toc *.temp *.bbl *.bcf *.blg *.fls *.run.xml *.fdb_latexmk *.xdv

clean: distclean
	rm -f *.pdf
