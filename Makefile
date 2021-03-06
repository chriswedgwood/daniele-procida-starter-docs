# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
SPHINXPROJ    = DanieleProcidaDocumentationStarterKit
SOURCEDIR     = .
BUILDDIR      = _build
VENV = env/bin/activate
PORT = 8001

# Put it first so that "make" without argument is like "make help".
help:
	. $(VENV); $(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

install:
	@echo "... setting up virtualenv"
	virtualenv env
	. $(VENV); pip install -r requirements.txt
	@echo "\n" \
	  "--------------------------------------------------------------- \n" \
      "* watch, build and serve the documentation: make run \n" \
	  "* check spelling: make spelling \n" \
	  "\n" \
      "enchant must be installed in order for pyenchant (and therefore \n" \
	  "spelling checks) to work. \n" \
	  "--------------------------------------------------------------- \n"

clean:
	-rm -rf _build/*

run:
	. $(VENV); sphinx-autobuild $(ALLSPHINXOPTS) . -a _build/html --host 0.0.0.0 --port $(PORT)


spelling:
	. $(VENV); $(SPHINXBUILD) -b spelling $(ALLSPHINXOPTS) . _build/spelling
	@echo
	@echo "Check finished. Wrong words can be found in " \
		"_build/spelling/output.txt."

open:
	open _build/html/index.html


.PHONY: help install clean run Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	. $(VENV); $(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)