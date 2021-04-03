#!/usr/bin/env -S bash ../.port_include.sh
port=nodejs
version=serenity-git
workdir=nodejs-main-serenity
useconfigure=true
files="https://nodejs.org/dist/v14.16.0/node-v14.16.0.tar.gz node-v14.16.0.tar.gz"
configopts="-DCMAKE_TOOLCHAIN_FILE=$SERENITY_ROOT/Toolchain/CMakeToolchain.txt"

configure() {
    run cmake $configopts
}

install() {
    run make install
}
