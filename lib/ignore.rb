# frozen_string_literal: true

module Ignore
  public

  module_function

  @@ignore = [
    "BINARYS",
    "FILE",
    "SHA256SUM",
    "TREE",
  ]

  def ignore
    @@ignore
  end

  def ignore=(val)
    @@ignore = val
  end
end
