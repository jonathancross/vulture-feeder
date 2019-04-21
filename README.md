# Vulture Feeder

A script to recklessly wipe out (supposedly) dead code identified by Vulture.
**Warning:** this may destroy your software if vulture is incorrect.

## Requirements

Install [vulture](https://pypi.org/project/vulture/) tool for identifying dead code.

    pip install vulture

## Usage

Check what vulture finds:

    vulture mydir

If you agree to wipe out the code vulture found:

    vulture mydir | vulture-feeder

Each modified file will be written as FILENAME.new so as not to damage the original.
Eventually this will change to overwrite the original file.

### Status

Pre-Alpha!  Only functions are deleted currently.

You may need to do some manual editing to fix things that break.

### Testing

    cd test
    ./_run_tests.sh

### Known Bugs

* Comments are not properly handled yet and can break the script.

### Author

[Jonathan Cross](https://jonathancross.com) PGP Key: `0xC0C076132FFA7695`

### License

WTFPL - See [LICENSE](LICENSE) for more info.
