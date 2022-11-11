# frozen_string_literal: true

module Cross
  module Rust
    GO_TARGETS = {
      "linux/386": ["i686-unknown-linux-gnu", "i686-unknown-linux-musl"],
      "linux/amd64": ["x86_64-unknown-linux-gnu", "x86_64-unknown-linux-musl"],
      "linux/arm/v5": ["armv5te-unknown-linux-gnueabi", "armv5te-unknown-linux-musleabi"],
      "linux/arm/v6": ["arm-unknown-linux-gnueabi", "arm-unknown-linux-gnueabihf"],
      "linux/arm/v7": "armv7-unknown-linux-gnueabihf",
      "linux/arm64": ["aarch64-unknown-linux-gnu", "aarch64-unknown-linux-musl"],
      "linux/mips": "mips-unknown-linux-gnu",
      "linux/mips64": "mips64-unknown-linux-gnuabi64",
      "linux/mips64le": "mips64el-unknown-linux-gnuabi64",
      "linux/mipsle": "mipsel-unknown-linux-gnu",
      "linux/ppc64": "powerpc64-unknown-linux-gnu",
      "linux/ppc64le": "powerpc64le-unknown-linux-gnu",
      "linux/riscv64": "riscv64gc-unknown-linux-gnu",
      "linux/s390x": "s390x-unknown-linux-gnu",
    }
  end
end
