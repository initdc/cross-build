# frozen_string_literal: true

module Ignore
  @@ignore = [
    "BINARYS",
    "FILE",
    "SHA256SUM",
    "TREE",
  ]
  def self.ignore
    @@ignore
  end
  def self.ignore=(val)
    @@ignore = val
  end
end
