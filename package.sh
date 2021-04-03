#!/usr/bin/env -S bash ../.port_include.sh
port=node
version=v14.16.0
useconfigure=true
files="https://nodejs.org/dist/v14.16.0/node-v14.16.0.tar.gz node-v14.16.0.tar.gz"
#configopts="--disable-nls --without-bash-malloc"

build() {
#    run_replace_in_file "s/define GETCWD_BROKEN 1/undef GETCWD_BROKEN/" config.h
#    run_replace_in_file "s/define CAN_REDEFINE_GETENV 1/undef CAN_REDEFINE_GETENV/" config.h
    run make $makeopts
}

post_install() {
    mkdir -p "${SERENITY_BUILD_DIR}/Root/bin"
    ln -s /usr/local/bin/node "${SERENITY_BUILD_DIR}/Root/bin/node"
}
