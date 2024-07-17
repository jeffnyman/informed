# Informed

_Worked Examples of the Inform Ecosystem_

This repository is a companion to my [Informing](https://github.com/jeffnyman/informing) repository. What this repository provides are worked examples that utilize the tooling from the Informing repository. This allows me to present examples that demonstrate features in a way distinct from the tooling itself and thus allow you to explore the Inform ecosystem more broadly.

---

## Experiment

The experiment is simple. To weave it:

- `inweb experiment -weave`

To tangle it:

- `inweb experiment -tangle`

To generate a makefile based on the tangled output:

- `inweb experiment -makefile experiment/app.mk`

To run the makefile:

- `make -f experiment/app.mk`

You can also weave the program as en book or a PDF file, although the appropriate tooling must be in place to support this. (See the Informing repository for details.)

- `inweb experiment -weave-as ebook`
- `inweb experiment -weave-as pdftex`
