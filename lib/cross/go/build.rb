# frozen_string_literal: true

module Cross
  module Go
    PM_BUILD = false

    BUILD_TMPL = "TARGET_ENV BUILD_CMD OUTPUT_ARG OUTPUT_FILE"
    BUILD_CMD = "go build"
    OUPUT_ARG = "-o"
    NEED_CREATE_DIR = false
  end
end
