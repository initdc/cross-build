# frozen_string_literal: true

require "unix"
require "ignore"

module Unix
  module File
    module_function

    extend Ignore

    def write(dir, file = "FILE")
      Dir.chdir dir do
        IO.write(file, "")

        cmd = "file *"
        IO.popen(cmd) do |r|
          lines = r.readlines

          for line in lines
            filename = line.delete_suffix("\n").split(":").first
            if not Ignore.ignore.include? filename
              print line if Unix.info
              IO.write(file, line, mode: "a")
            end
          end
        end
      end
    end
  end
end
