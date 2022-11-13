# frozen_string_literal: true

require_relative "cross/version"
require_relative "cross/help"
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
  ch = Cross::Help.new("cross-rb", "[Golang Rust Zig C] just need build once time!")
  ch.debug = false

  ch.add_cmd({
    :use => "help",
    :short => "show help info",
  })

  ch.add_cmd({
    :use => "are_you_ok_I_am_more_than_@cmd_short",
    :short => "show help info",
  })

  ch.add_cmd({
    :use => "bom",
    :short => "show help info",
  })

  ch.p_desc
  ch.p_usage
  ch.p_cmds
end
