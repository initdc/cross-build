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
      while !r.eof?
        print r.gets
      end
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

  def by_ls_1(dir)
    arr = []
    Exec::each_line("ls -1 #{dir}") do |line|
      arr.push line.chomp
    end
    return arr
  end

  def each_ls_1(dir)
    Exec::each_line("ls -1 #{dir}") do |line|
      yield line
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
    return output.chomp
  end
end
