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
    :s_desc => "show help info",
  })

  ch.add_cmd({
    :use => "are_you_ok_I_am_more_than_@cmd_short",
    :s_desc => "show help info",
  })

  ch.add_cmd({
    :use => "bom",
    :s_desc => "show help info",
  })

  ch.add_flag({
    :s_use => "-f",
    :l_use => "--force",
    :desc => "force build",
  })

  ch.add_flag({
    :s_use => "-ffffffffff",
    :l_use => "--forceeeeeeee",
    :desc => "force build",
  })

  go = Cross::Help.new("go", "Golang just need build once time!")
  go.add_cmds [{
                :use => "help",
                :s_desc => "show golang help info",
              },
               {
                :use => "are_you_ok_I_am_more_than_@cmd_short",
                :s_desc => "show help info",
              }]

  go.add_flags [{
                 :s_use => "-f",
                 :l_use => "--force",
                 :desc => "force build golang",
               },
                {
                 :s_use => "-ffffffffff",
                 :l_use => "--forceeeeeeee",
                 :desc => "force build",
               }]

  ch.add_subcmd(go)

  ch.p_init
  ch.p_desc
  ch.p_usage
  ch.p_subcmds
  ch.p_cmds
  ch.p_flags
  ch.p_more

  # go.p_desc
  # go.p_usage
  # go.p_cmds
  # go.p_flags
  # go.p_more
end
