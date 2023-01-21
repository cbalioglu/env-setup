# Environment Setup
This repository contains dotfiles, installers, scripts, and other files that I
use to set up my Unix-like machines for day-to-day work.

## dotfiles & dotfiles-fb
As their names suggest, these directories contain my dotfiles. Besides the
typical configuration files (e.g. `.bashrc`, `.vimrc`) they also contain
Facebook specific configuration files that are relevant only for FB employees
working on the PyTorch AWS Cluster. The files can be installed to their correct
locations by running the `install-dotfiles` or `install-dotfiles-fb` scripts
(the latter internally calls the former).

## projects
This directory has a subdirectory per project (e.g. PyTorch). Each subdirectory
contains script(s) relevant to set up a development environment for that
particular project. For instance, a PyTorch development environment can be set
up via:

```sh
$ cd <pytorch-repo-dir>
$ source <env-setup-repo-dir>/projects/pytorch/set-env
PyTorch development environment is set.

You can switch between different compiler and build combinations by executing:
 - switch-gcc-debug
 - switch-gcc-release
 - switch-gcc-relwithdebinfo
 - switch-clang-debug
 - switch-clang-release
 - switch-clang-relwithdebinfo

You can build the library and the documentation by executing:
 - make-lib
 - make-docs

(pytorch-gcc-release) $
```
The `set-env` script in the example above sets up all the environment variables
and flags that are needed for a standard build of PyTorch.

## stow
This directory includes the installer scripts for various tools and libraries
(e.g. llvm, protobuf). The artifacts will be installed to a project specific
subdirectory under `~/.local/stow`. By using GNU Stow a symlink farm can be set
up. For instance LLVM 10.0.1 can be symlinked under `~/.local` via:

```sh
$ <env-setup-repo-dir>/stow/install-llvm
$ cd ~/.local/stow
$ stow llvm-10.0.1
```

or:

```sh
$ <env-setup-repo-dir>/stow/install-llvm
$ stow -d ~/.local/stow -t ~/.local llvm-10.01
```

To install a specific version you can execute the installer scripts with a
version number:

```sh
$ <env-setup-repo-dir>/stow/install-llvm 10.0.1
```

Specific to CPython, you can also append a "-dbg" tag to the version number to
build a debug version:

```sh
$ <env-setup-repo-dir>/stow/install-cpython 3.6.14-dbg
```
