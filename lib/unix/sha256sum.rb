# frozen_string_literal: true

require_relative "comm"
require "ignore"

module Unix
  module SHA256SUM
    def self.write(dir, file = "SHA256SUM")
      Dir.chdir dir do
        IO.write(file, "")

        cmd = "sha256sum *"
        IO.popen(cmd) do |r|
          lines = r.readlines

          for line in lines
            filename = line.delete_suffix("\n").split(" ").last
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
