# frozen_string_literal: true

require_relative "cross/version"
require_relative "cross/go/build"
require_relative "cross/go/target"
require_relative "cross/go/test"

module Cross
  class Error < StandardError; end
  # Your code goes here...
end
