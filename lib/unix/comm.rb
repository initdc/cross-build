# frozen_string_literal: true

require "mod_comm"

module Unix
  module_function
  extend ModComm

  Unix.debug = false
  Unix.info = true
end
