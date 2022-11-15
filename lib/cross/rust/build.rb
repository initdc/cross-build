# frozen_string_literal: true

module Cross
  module Rust
    PM_BUILD = true

    BUILD_TMPL = "TARGET_ENV BUILD_CMD RELEASE_ARG TARGET_ARG"
    BUILD_CMD = "cargo build"
    NEED_CREATE_DIR = false

    RELEASE_BUILD = true
    RELEASE_ARG = RELEASE_BUILD == true ? "--release" : ""
    RELEASE = RELEASE_BUILD == true ? "release" : "debug"
  end
end
