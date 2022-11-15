# frozen_string_literal: true

require "cross/flow"
require_relative "build"
require_relative "target"
require_relative "test"

module Cross
  module Go
    extend Cross::Flow

    class Flow
      def build
        Go.build
      end
    end
  end
end
