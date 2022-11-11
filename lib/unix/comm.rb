# frozen_string_literal: true

module Unix
  @@debug = false
  def self.debug
    @@debug
  end
  def self.debug=(val)
    @@debug = val
  end

  @@info = true
  def self.info
    @@info
  end
  def self.info=(val)
    @@info = val
  end
end
