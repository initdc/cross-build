# frozen_string_literal: true

require "digest"
require_relative "ignore"

module SHA256SUM
  @@info = true

  def self.info=(val)
    @@info = val
  end

  def self.write(dir, file = "SHA256SUM")
    d = Dir.new(dir)
    Dir.chdir dir do
      IO.write(file, "")

      d.children.sort!.each do |child|
        if not Ignore.ignore.include? child
          sha256sum = Digest::SHA256.file(child).hexdigest
          line = "#{sha256sum}  #{child}\n"
          print line
          IO.write(file, line, mode: "a")
        end
      end
    end
  end
end
