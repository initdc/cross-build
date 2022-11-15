# frozen_string_literal: true

require "exec"

module Cross
  module Go
    TEST_CMD = "go test"

    CROSS_TEST = true
    CROSS_TEST_DEPS = [
      "qemu-user",
    ]
    CROSS_TEST_RUNNER = {
      "386": "",
      "amd64": "",
      "arm": "qemu-arm",
      "arm64": "qemu-aarch64",
      "mips": "qemu-mips",
      "mips64": "qemu-mips64",
      "mips64le": "qemu-mips64el",
      "mipsle": "qemu-mipsel",
      "ppc64": "qemu-ppc64",
      "ppc64le": "qemu-ppc64le",
      "riscv64": "qemu-riscv64",
      "s390x": "qemu-s390x",
    }

    def self.install_test_deps
      cmd = "sudo apt-get install -y #{CROSS_TEST_DEPS.join(" ")}"
      Exec::code cmd, 1
    end
  end
end
