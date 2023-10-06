# Introduction

This [WSL2-Gentoo-Kernel][wsl2-kernel] repo contains kernel source code and
configuration files for a customized [WSL2][about-wsl2] kernel meant to be built and run on a Gentoo stage tarball imported into WSL2. It can be compiled succesfully with the clang or gcc toolchains (See below for build instructions).

# Reporting Bugs

If you discover an issue relating to the original WSL or WSL2 kernel, please report it on
the [WSL GitHub project][wsl-issue]. It is not possible to report issues on the
[WSL2-Linux-Kernel][wsl2-kernel] project.

If you're able to determine that the bug is present in the upstream Linux
kernel, you may want to work directly with the upstream developers. Please note
that there are separate processes for reporting a [normal bug][normal-bug] and
a [security bug][security-bug].

# Contributing

If you're able and interested in contributing kernel code specific to Gentoo and WSL2, please submit a patch to this project. I would appreciate it!

# Build Instructions

Instructions for building an x86_64 WSL2 kernel with a Gentoo distribution are
as follows:

1. Make sure your system is up to date:
   `$ sudo emerge --sync`
   `$ sudo emerge --update --newuse --deep --with-bdeps=y @world`

2. Install the build dependencies:
   (For those who prefer gcc):
   `$ sudo emerge sys-devel/gcc app-arch/cpio dev-lang/perl sys-devel/bc sys-devel/make sys-libs/ncurses virtual/libelf virtual/pkgconfig dev-util/pahole`
   
   (For those who prefer clang):
   `$ sudo emerge sys-devel/clang app-arch/cpio dev-lang/perl sys-devel/bc sys-devel/bison sys-devel/flex sys-devel/make sys-libs/ncurses virtual/libelf dev-util/pahole`
   
   (All other required dependencies will be emerged automatically)

3. Switch to the directory that contains the WSL2 Kernel sources and update them if neccesary: 
   `$ cd <full path to the downloaded sources>`
   (Only if you used git to download the sources):
   `$ git pull`

4. Build the kernel using the WSL2 kernel configuration: 
   (For those who prefer gcc):
   `$ make KCONFIG_CONFIG=config-wsl -j4`
   
   (For those who prefer clang):
   `$ make LLVM=1 LLVM_IAS=1 KCONFIG_CONFIG=config-wsl -j4`

# Install Instructions

Please see the documentation on the [.wslconfig configuration
file][install-inst] for information on using a custom built kernel.

[wsl2-kernel]:  https://github.com/nullorigin/WSL2-Gentoo-Kernel
[about-wsl2]:   https://docs.microsoft.com/en-us/windows/wsl/about#what-is-wsl-2
[wsl-issue]:    https://github.com/microsoft/WSL/issues/new/choose
[normal-bug]:   https://www.kernel.org/doc/html/latest/admin-guide/bug-hunting.html#reporting-the-bug
[security-bug]: https://www.kernel.org/doc/html/latest/admin-guide/security-bugs.html
[submit-patch]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html
[install-inst]: https://docs.microsoft.com/en-us/windows/wsl/wsl-config#configure-global-options-with-wslconfig
