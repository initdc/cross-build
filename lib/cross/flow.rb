# frozen_string_literal: true

module Cross
  module Flow
    module_function

    public

    def build
      p self::constants
      if self::PM_BUILD
        puts "using package manager ..."
      else
        puts "not using package manager"
      end

      p self::BUILD_TMPL
      p self::const_defined? :RELEASE_BUILD
    end
  end
end
