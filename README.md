# arabica
A sound and versatile [Pandoc](http://pandoc.org/) [LaTeX](https://www.latex-project.org/) boilerplate to convert your [Markdown](https://daringfireball.net/projects/markdown/) files to PDF featuring [KOMA-Script](https://ctan.org/pkg/koma-script?lang=en).
The *arabica* boilerplate is designed to *produce academic books* with focus on philosphy, humanities and mathematics.
It is designed to be maximally configurable via [YAML](http://yaml.org/) files (see `./settings/`).
Your contents live in a seperate directory (see `./core/`) where they can be organised in a modular fashion.
The *template* itself lives in `./controls/`.

# Thanks
The [*arabica boilerplate*](https://github.com/qualiacode/arabica) is inspired by the [pandoc latex template *eisvogel* by Wandmalfarbe](https://github.com/Wandmalfarbe/pandoc-latex-template) and was built with the help of the following sources and tools: [References and Credits](#references-and-credits).

# Installation
## Preconditions
1. Install [TeX Live](https://www.tug.org/texlive/) or any alternative LaTeX distribution.
2. Install [pandoc](https://pandoc.org/).

## Install arabica boilerplate
1. Go to your templates directory: `cd /path/to/your/templates/`.
2. Clone (or download) this repository
`git clone https://github.com/qualiacode/arabica.git`
3. Done!

# Usage
1. Copy the entire *arabica boilerplate* located at your local templates to your directory of your projects: `cp /path/to/your/templates/arabica/* /path/to/your/projects/projectname/`
2. Go to your project directory: `cd /path/to/your/projects/projectname/`
3. Delete unwanted files like `./examples`: `rm -vrf examples/*`
4. Fill in the gaps, set your settings.
5. Execute pandoc:
```shell
pandoc --data-dir=$HOME/path/to/your/projects/projectname/ -s -o ./output/projectname.pdf --filter pandoc-crossref --filter pandoc-citeproc --pdf-engine=xelatex --top-level-division=chapter --number-sections --template $HOME/path/to/your/projects/projectname/controls/arabica.latex ./core/*.md ./settings/*.yaml
```
6. Done!

7. Alternatively you can omit the long path in the `--template` option by copying the `arabica.latex` template located at `./controls/arabica.latex` to the default directory of your pandoc templates located at `~/.pandoc/templates/`.

8. If you have copied the `arabica.latex` template into the directory of your default pandoc templates, then you can execute pandoc like this:
```shell
pandoc --data-dir=$HOME/path/to/your/projects/projectname/ -s -o ./output/projectname.pdf --filter pandoc-crossref --filter pandoc-citeproc --pdf-engine=xelatex --top-level-division=chapter --number-sections --template arabica ./core/*.md ./settings/*.yaml
```

9. Please note, though: the *arabica boilerplate* is designed to be used with the given directory structure respectively file structure indicated in [BODYPLAN.md](./BODYPLAN.md).
Of particular importance are the *metadata* and *settings* files: `./settings/00_01_metadata.yaml` `./settings/00_02_settings.yaml`.

10. The boilerplate should work even if you change its inner structure but keep in mind to change all the paths and variables accordingly.
The `arabica.template` file may work as long as you provide some basic variables used in this template file.

# Other
## Read out your current default template execude: `pandoc -D latex > default.latex`.

# References and Credits
1. Plot graphics: [Gnuplot](http://gnuplot.sourceforge.net/demo_5.0/hidden2.html)
2. Blind text: [Jasper Van der Jeugt lorem-markdownum](https://github.com/jaspervdj/lorem-markdownum)
3. Bug fix by [Marco Torchiano \@ StackExchange](https://tex.stackexchange.com/questions/161431/how-to-solve-longtable-is-not-in-1-column-mode-error?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa) see [Pandoc issue 1023](https://github.com/jgm/pandoc/issues/1023).
4. [Atom editor](https://atom.io/)
5. [Better Bib(La)TeX for Zotero](https://retorque.re/zotero-better-bibtex/)
6. [git](https://git-scm.com/)
7. [KOMA-Script](https://ctan.org/pkg/koma-script?lang=en)
8. [LaTeX](https://www.latex-project.org/)
9. [Markdown](https://daringfireball.net/projects/markdown/)
10. [Pandoc](http://pandoc.org/)
11. [Pandoc-citeproc](https://github.com/jgm/pandoc-citeproc)
12. [Pandoc-crossref](https://github.com/lierdakil/pandoc-crossref)
13. [TeXLive](https://www.tug.org/texlive/)
14. [XeTeX](http://xetex.sourceforge.net/)
15. [Zotero](https://www.zotero.org/)
16. [zotero-citations](https://github.com/retorquere/zotero-citations)
17. [zotero-picker](https://github.com/oztalha/zotero-picker/)
18. [zotfile](https://github.com/jlegewie/zotfile).
