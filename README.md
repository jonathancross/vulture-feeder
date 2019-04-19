# Vulture Feeder

A script to recklessly wipe out (supposedly) dead code identified by Vulture.
**Warning:** this may destroy your software if vulture is incorrect.

## Requirements

Install [vulture](https://pypi.org/project/vulture/) tool for identifying dead code.

    pip install vulture

## Usage

Check what vulture finds:

    vulture mydir

If you agree to DESTROY the code vulture found:

    vulture mydir | vulture-feeder

### Status

Pre-Alpha!  Only functions are deleted currently.

You may need to do some manual editing to fix things that break.

### Known Bugs

* Functions with blank lines.
* May wipe out the first line of a tripple-quote comment

### Author

[Jonathan Cross](https://jonathancross.com) PGP Key: `0xC0C076132FFA7695`

### License

WTFPL - See [LICENSE](LICENSE) for more info.
