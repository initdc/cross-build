# frozen_string_literal: true

module Exec
  @@debug = false
  @@info = true

  def self.debug=(val)
    @@debug = val
  end

  def self.info=(val)
    @@info = val
  end

  def self.run(cmd)
    puts cmd if @@info

    # https://docs.ruby-lang.org/en/master/IO.html#method-c-popen
    IO.popen(cmd) do |r|
      puts r.readlines
    end
    return nil
  end

  def self.code(cmd, *opt)
    catch_error = opt[0] || false
    code = opt[1] || 1

    puts cmd if @@info

    # https://docs.ruby-lang.org/en/master/Kernel.html#method-i-system
    result = system cmd
    if catch_error and (not result)
      exit code
    end
    return result
  end

  def self.output(cmd)
    puts cmd if @@info

    # https://docs.ruby-lang.org/en/master/Kernel.html#method-i-60
    output = `#{cmd}`
    return output.delete_suffix("\n")
  end
end
