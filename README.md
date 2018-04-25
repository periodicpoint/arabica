# arabica
A sound and versatile [pandoc](http://pandoc.org/) [LaTeX](https://www.latex-project.org/) boilerplate to produce academic books (in PDF) utilising solely modular [Markdown](https://daringfireball.net/projects/markdown/) files, featuring
[YAML](http://yaml.org/), [KOMA-Script](https://ctan.org/pkg/koma-script?lang=en), [BibLaTeX](https://ctan.org/pkg/biblatex?lang=en) and
[CSL](http://citationstyles.org/).

For typesetting an **article** please see the
[**robusta boilerplate**](https://github.com/qualiacode/robusta).

# Thanks
The [*arabica boilerplate*](https://github.com/qualiacode/arabica) is inspired by the [pandoc latex template *eisvogel* by Wandmalfarbe](https://github.com/Wandmalfarbe/pandoc-latex-template) and was built with the help of the following sources and tools: [References and Credits](#references-and-credits).
For other projects like the one at hand please see [the list of user contributed templates at the pandoc wiki](https://github.com/jgm/pandoc/wiki/User-contributed-templates)
and
[the list of pandoc boilerplates at the pandoc wiki](https://github.com/jgm/pandoc/wiki/Pandoc-Boilerplates).

# Features
1. **Simple** Your writing process is as simple as possible because you only need to write Markdown files and let the **strong defaults** of pandoc and LaTeX work for you. (see `./controls/` and `./settings/`)
2. **Configurable** Your book projects are as configurable as possible because you can set your **metadata and variables** via YAML files and then reuse them if you want to. (see `./settings/`)
3. **Modular** Your book projects are as modular as possible because of strict **separation of contents and presentation** (style).
Your content live in separate directory (see `./core/`) where you can organise them intuitively.
The *pandoc template* itself lives in `./controls/`.
4. State-of-the-art technology stack and low tech debt at the same time.

# Preview
Default title page | Default info page | Default example page
:-----------------:|:-----------------:|:--------------------:
[![Default title page ](/examples/default_a/output/titlepage.png)](/examples/default_a/output/arabica.pdf) | [![Default info page](/examples/default_a/output/infopage.png)](/examples/default_a/output/arabica.pdf) | [![Default example page](/examples/default_a/output/examplepage.png)](/examples/default_a/output/arabica.pdf)

# Examples
Go to `./examples/` [to view a list of complete example book projects](/examples/).

# Install
## Preconditions
1. Install [TeX Live](https://www.tug.org/texlive/) or any alternative [LaTeX distribution](https://www.latex-project.org/get/).
2. Install [pandoc](https://pandoc.org/).

## Clone
1. Go to your templates directory: `cd /path/to/your/templates/`.
2. Clone (or download) this repository
`git clone https://github.com/qualiacode/arabica.git`
3. **Done!**

# Use
## Optional: copy, paste, rename, delete
1. Copy the entire *arabica boilerplate* located at your own local templates directory and paste the entire *arabica boilerplate* to your directory of your own projects directory:
`cp /path/to/your/templates/arabica/* /path/to/your/projects/projectname/`
2. Go to your project directory:
`cd /path/to/your/projects/projectname/`
3. Delete all the files you do not need e.g. `./examples`:
`rm -vrf examples/*`

## Set metadata
1. Go to `./settings/00_01_metadata.yaml`
2. Set your (meta)data, the more the better.
3. It is a good idea to add at least one **author**, a **title** and a **year**.
4. Enclose your values ((meta)data) in single quotes: `'()(meta)data)'`.
5. If you want to leave a value undefined enter a tilde.
6. Example:

```yaml
title: &title 'Short title'

subtitle: &subtitle ~

author: &author
  - 'Jane Roe'
  - 'John Doe'

year: '2018'
```

## Set variables
1. You can leave the defaults and you will be fine most of the time.
2. If you want to change things, then the same rules as in [Metadata settings](#metadata-settings) apply.
3. Go to `./settings/00_01_settings.yaml`.
4. Set your settings.
5. Example:

```yaml
classoption:
  - 'twoside'
  - 'twocolumn'
  - 'parskip=full'

custom_title_page: false

...

toc: true
```

## Collect
1. Do your research, collect your bibliographic data.
2. Go to `./bib/`
3. Save your bibliographic data in `Bib(La)TeX` format (`.bib`) in the file `./bib/.references.bib`.
4. Go to `./settings/00_01_settings.yaml`.
5. Refer to your `.bib` file by adding the corresponding path of your `.bib` file as `value` to the corresponding `key`.
6. Example (default):
```
bibliography: './bib/references.bib'
```
7. Example entry in your `.bib` file:
```
@article{Cantor1984,
  langid = {german},
  title = {Ein Beitrag zur Mannigfaltigkeitslehre},
  volume = {1877},
  doi = {10.1007/978-3-7091-9516-1_3},
  journaltitle = {Über unendliche, lineare Punktmannigfaltigkeiten},
  date = {1984},
  pages = {25-44},
  author = {Cantor, Georg}
}
```
8. In this example your `cite key` for this bibliographic entry is `Cantor1984`.

## Select
1. Go to [CSL](http://citationstyles.org/)
2. Dowload your desired *citation style language file* e.g. `chicago-author-date-de.csl`.
3. Save your `.csl` fiile to: `./csl/`
4. Go to `./settings/00_01_settings.yaml`.
5. Refer to your `.csl` file by adding the corresponding path of your `.csl` file as `value` to the corresponding `key`.
6. Example (default):
```
csl: './csl/chicago-author-date-de.csl'
```

## Write
1. Go to `./core/` and write you markdown files.
2. Organise them as you like but keep in mind that pandoc will append them sequentially, determined by the alpha-numeric ordering of your file names.
3. A good example:

```
01_introduction.md
02_mainpart.md
03_conclusion.md
```

## Cite
1. Cite your sources by adding your refercences via `[@citekey]` to your markdown file(s) where ever you need them.
2. Example:
```
„Cantor once said: ‚Wenn zwei wohldefinirte Mannigfaltigkeiten ...‘ [@Cantor1984]“
```

## Run
1. Execute pandoc with the following options:

```shell
pandoc                                                                      \
  -s                                                                        \
  -o ./output/projectname.pdf                                               \
  --data-dir=$HOME/path/to/your/projects/projectname/                       \
  --filter pandoc-crossref                                                  \
  --filter pandoc-citeproc                                                  \
  --pdf-engine=xelatex                                                      \
  --top-level-division=chapter                                              \
  --number-sections                                                         \
  --template $HOME/path/to/your/projects/projectname/controls/arabica.latex \
  ./core/*.md                                                               \
  ./settings/*.yaml                                                         \
  ./metadata/*.yaml
```

2. **Done!**

3. Alternatively you can omit the long path in the `--template` option by copying the `arabica.latex` template located at `./controls/arabica.latex` to the default directory of your pandoc templates located at `~/.pandoc/templates/`.

4. If you have copied the `arabica.latex` template into the directory of your default pandoc templates, then you can execute pandoc like this:

```shell
pandoc                                                \
  -s                                                  \
  -o ./output/projectname.pdf                         \
  --data-dir=$HOME/path/to/your/projects/projectname/ \
  --filter pandoc-crossref                            \
  --filter pandoc-citeproc                            \
  --pdf-engine=xelatex                                \
  --top-level-division=chapter                        \
  --number-sections                                   \
  --template arabica.latex                            \
  ./core/*.md                                         \
  ./settings/*.yaml                                   \
  ./metadata/*.yaml
```

5. For debugging puproses you can produce a `.tex` file by runing pandoc with
```
-o ./output/projectname.tex
```

5. Please note, though: the *arabica boilerplate* is designed to be used with the given directory structure respectively file structure indicated in [BODYPLAN.md](./BODYPLAN.md).
Of particular importance are the *metadata* and *settings* files: `./metadata/00_01_metadata.yaml` `./settings/00_02_settings.yaml`.

6. The boilerplate should work even if you change its inner structure but keep in mind to change all the paths and variables accordingly.
The `arabica.template` file may work as long as you provide some basic variables used in this template file.

# Enjoy
1. Go to `./output/` and enjoy your results.

# Other
1. To read out your current default template execute:
`pandoc -D latex > default.latex`.

# License
MIT License

Copyright (c) 2018 Martin Maga

Go to [./LICENSE.md](./LICENSE.md).

# References and Credits
1. Plot graphics: [Gnuplot](http://gnuplot.sourceforge.net/demo_5.0/hidden2.html)
2. Blind text: [Jasper Van der Jeugt lorem-markdownum](https://github.com/jaspervdj/lorem-markdownum)
3. Bug fix by [Marco Torchiano \@ StackExchange](https://tex.stackexchange.com/questions/161431/how-to-solve-longtable-is-not-in-1-column-mode-error?utm_medium=organic&utm_source=google_rich_qa&utm_campaign=google_rich_qa) see [Pandoc issue 1023](https://github.com/jgm/pandoc/issues/1023).
4. [Atom editor](https://atom.io/)
5. [Better Bib(La)TeX for Zotero](https://retorque.re/zotero-better-bibtex/)
6. [CSL](http://citationstyles.org/)
7. [git](https://git-scm.com/)
8. [KOMA-Script](https://ctan.org/pkg/koma-script?lang=en)
9. [LaTeX](https://www.latex-project.org/)
10. [Markdown](https://daringfireball.net/projects/markdown/)
11. [Pandoc](http://pandoc.org/)
12. [Pandoc-citeproc](https://github.com/jgm/pandoc-citeproc)
13. [Pandoc-crossref](https://github.com/lierdakil/pandoc-crossref)
14. [TeXLive](https://www.tug.org/texlive/)
15. [XeTeX](http://xetex.sourceforge.net/)
16. [YAML](http://yaml.org/)
17. [Zotero](https://www.zotero.org/)
18. [zotero-citations](https://github.com/retorquere/zotero-citations)
19. [zotero-picker](https://github.com/oztalha/zotero-picker/)
20. [zotfile](https://github.com/jlegewie/zotfile).
