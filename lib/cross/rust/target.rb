# frozen_string_literal: true

require "exec"

module Cross
  module Rust

    # Rust Platform Support Tier ( 1 & 2 ) with Host Tools
    # https://doc.rust-lang.org/nightly/rustc/platform-support.html
    # linker info from cross-rs/cross
    # https://github.com/cross-rs/cross/tree/main/docker
    TIER_1_HOST = {
      "aarch64-unknown-linux-gnu": "aarch64-linux-gnu-gcc",
      "i686-pc-windows-gnu": "i686-w64-mingw32-gcc",
      "i686-pc-windows-msvc": "",
      "i686-unknown-linux-gnu": "i686-linux-gnu-gcc",
      "x86_64-apple-darwin": "x86_64-apple-darwin-clang",
      "x86_64-pc-windows-gnu": "x86_64-w64-mingw32-gcc",
      "x86_64-pc-windows-msvc": "",
      "x86_64-unknown-linux-gnu": "x86_64-linux-gnu-gcc",
    }

    TIER_2_HOST = {
      "aarch64-apple-darwin": "aarch64-apple-darwin-gcc",
      "aarch64-pc-windows-msvc": "",
      "aarch64-unknown-linux-musl": "aarch64-linux-musl-gcc",
      "arm-unknown-linux-gnueabi": "arm-linux-gnueabi-gcc",
      "arm-unknown-linux-gnueabihf": "arm-linux-gnueabihf-gcc",
      "armv7-unknown-linux-gnueabihf": "arm-linux-gnueabihf-gcc",
      "mips-unknown-linux-gnu": "mips-linux-gnu-gcc",
      "mips64-unknown-linux-gnuabi64": "mips64-linux-gnuabi64-gcc",
      "mips64el-unknown-linux-gnuabi64": "mips64el-linux-gnuabi64-gcc",
      "mipsel-unknown-linux-gnu": "mipsel-linux-gnu-gcc",
      "powerpc-unknown-linux-gnu": "powerpc-linux-gnu-gcc",
      "powerpc64-unknown-linux-gnu": "powerpc64-linux-gnu-gcc",
      "powerpc64le-unknown-linux-gnu": "powerpc64le-linux-gnu-gcc",
      "riscv64gc-unknown-linux-gnu": "riscv64-linux-gnu-gcc",
      "s390x-unknown-linux-gnu": "s390x-linux-gnu-gcc",
      "x86_64-unknown-freebsd": "x86_64-unknown-freebsd-gcc",
      "x86_64-unknown-illumos": "x86_64-unknown-illumos-gcc",
      "x86_64-unknown-linux-musl": "",
      "x86_64-unknown-netbsd": "x86_64-unknown-netbsd-gcc",
    }

    TIER_2 = {
      "aarch64-linux-android": "aarch64-linux-android-gcc",
      "arm-linux-androideabi": "arm-linux-androideabi-gcc",
      "armv7-linux-androideabi": "arm-linux-androideabi-gcc",
      "i686-linux-android": "i686-linux-android-gcc",
      "i686-unknown-linux-musl": "",
      "x86_64-linux-android": "x86_64-linux-android-gcc",
    }

    LINUX_ARM = {
      # Tier 2
      "5": { "armv5te-unknown-linux-gnueabi": "arm-linux-gnueabi-gcc", "armv5te-unknown-linux-musleabi": "arm-linux-musleabi-gcc" },
      # Tier 2 Host
      "6": { "arm-unknown-linux-gnueabi": "arm-linux-gnueabi-gcc", "arm-unknown-linux-gnueabihf": "arm-unknown-linux-gnueabihf-gcc" },
      "7": { "armv7-unknown-linux-gnueabihf": "arm-linux-gnueabihf-gcc" },
    }

    TARGETS = [TIER_1_HOST, TIER_2_HOST, LINUX_ARM[:"5"], TIER_2]

    TEST_TARGETS = [TIER_1_HOST, LINUX_ARM[:"6"], LINUX_ARM[:"7"]]

    LESS_TARGETS = [{
      "aarch64-unknown-linux-gnu": "aarch64-linux-gnu-gcc",
      "x86_64-unknown-linux-gnu": "x86_64-linux-gnu-gcc",
    }]

    TARGETS_DEPS = [
      "gcc-aarch64-linux-gnu",
      "gcc-arm-linux-gnueabi",
      "gcc-arm-linux-gnueabihf",
      "gcc-mips-linux-gnu",
      "gcc-mips64-linux-gnuabi64",
      "gcc-mips64el-linux-gnuabi64",
      "gcc-mipsel-linux-gnu",
      "gcc-powerpc-linux-gnu",
      "gcc-powerpc64-linux-gnu",
      "gcc-powerpc64le-linux-gnu",
      "gcc-riscv64-linux-gnu",
      "gcc-s390x-linux-gnu",
      "gcc-i686-linux-gnu",
      "gcc-x86-64-linux-gnu",
      "gcc-x86-64-linux-gnux32",
      "gcc-mingw-w64-i686",
      "gcc-mingw-w64-x86-64",
      "musl-dev",
      "musl-tools",
    ]

    def self.install_targets_deps
      cmd = "sudo apt-get install -y #{TARGET_DEPS.join(" ")}"
      Exec.code cmd, 1
    end

    def self.fmt_linker_env(target, linker)
      if linker != ""
        fmt_tg = target.to_s.split("-").join("_").upcase
        linker_env = "CARGO_TARGET_#{fmt_tg}_LINKER=#{linker}"

        puts linker_env
        return linker_env
      else
        return ""
      end
    end
  end
end
