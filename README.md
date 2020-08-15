# shest
A tool for sequenced internal and external automated testing of shell scripts and other command line tools.

If you're looking for bash unit tests, you're almost certainly better off with [bats](https://github.com/sstephenson/bats), which looks excellent for this purpose.

Shest is aimed at automating

* Environment creation/destruction.
* Adapting the the test environment in a staged way.
* Testing every step of the way.
    * Unit testing.
    * Integration testing.
    * Regression testing.

## Requirements

* bash
* rsync
