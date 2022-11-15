# frozen_string_literal: true

module ModComm
  module_function

  public

  def default
    @debug = false
    @info = true
  end

  def debug
    @debug
  end

  def debug=(val)
    @debug = val
  end

  def info
    @info
  end

  def info=(val)
    @info = val
  end
end
