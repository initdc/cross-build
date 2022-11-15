# frozen_string_literal: true

require "mod_comm"
require "unix/file"
require "unix/sha256sum"
require "unix/tree"

module Unix
  extend ModComm

  self::default
end
