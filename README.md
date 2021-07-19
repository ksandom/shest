# shest
A tool for sequenced internal and external automated testing of shell scripts and other command line tools.

You may also want to check out [bats](https://github.com/bats-core/bats-core), which is a similar tool that wasn't suitable for my needs, but may be for yours.

Shest is aimed at automating

* Environment creation/destruction.
* Adapting the the test environment in a staged way.
* Testing every step of the way.
    * Unit testing.
    * Integration testing.
    * Regression testing.

## Some projects using shest

* [shest](https://github.com/ksandom/shest) (itself).
* [duse](https://github.com/ksandom/duse) - Proactively manage media caching.

More to be listed soon ;)

## Requirements

### For operation

* [bash](https://man7.org/linux/man-pages/man1/bash.1.html).
* [rsync](https://man7.org/linux/man-pages/man1/rsync.1.html).
* [readlink](https://man7.org/linux/man-pages/man1/readlink.1.html).

### For development of duse

* [shest](https://github.com/ksandom/shest) (itself) for unit testing.
* [shellcheck](https://github.com/koalaman/shellcheck) for linting.

## Install

```bash
sudo make install
```

## Using it

### Get help

```bash
shest --help
```

### Get a project set up

1. Go into the root directory of your project.
1. Run
    ```bash
    shest --createProject
    ```
    This will create a folder called `shest` with all the relevant goodies.
1. Check the contents of ./shest/config/general to make sure it fits well with your project. The defaults should be pretty good.
1. `mkdir -p shest/unit/stageName ; cd shest/unit/stageName`
1. `shest --createTest aNewTest` <- This will create `aNewTest` that you can rename and edit to your liking.
1. `shest` <- This will run all of the tests. This is essentially an alias of `shest --run`. You can also do `shest --run unit` (or similar) to specify just the unit tests.
