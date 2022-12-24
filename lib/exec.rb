# frozen_string_literal: true

require "mod_comm"

module Exec
  extend ModComm

  self::default

  module_function

  def run(cmd)
    puts cmd if Exec.info

    # https://docs.ruby-lang.org/en/master/IO.html#method-c-popen
    IO.popen(cmd) do |r|
      puts r.readlines
    end
    return nil
  end

  def each_line(cmd)
    puts cmd if Exec.info

    # https://docs.ruby-lang.org/en/master/IO.html#method-i-each_line
    IO.popen(cmd) do |r|
      r.each_line do |line|
        yield line
      end
    end
  end

  def code(cmd, *opt)
    catch_error = opt.nil? || false
    code = opt[0] || 1

    puts cmd if Exec.info

    # https://docs.ruby-lang.org/en/master/Kernel.html#method-i-system
    result = system cmd
    if catch_error and (not result)
      exit code
    end
    return result
  end

  def output(cmd)
    puts cmd if Exec.info

    # https://docs.ruby-lang.org/en/master/Kernel.html#method-i-60
    output = `#{cmd}`
    return output.delete_suffix("\n")
  end
end
