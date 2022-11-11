# frozen_string_literal: true

class ClassComm
  attr_accessor :debug, :info

  def initialize
    self.debug = false
    self.info = true
  end
end
