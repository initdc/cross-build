# frozen_string_literal: true

require_relative "cross/version"
require_relative "cross/go/build"
require_relative "cross/go/target"
require_relative "cross/go/test"
require_relative "sha256sum"
require_relative "unix/sha256sum"
require_relative "unix/tree"
require_relative "unix/file"

module Cross
  class Error < StandardError; end
  # Your code goes here...
end
