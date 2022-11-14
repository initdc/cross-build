# frozen_string_literal: true

require_relative "class_comm"
require_relative "help/p"

# https://cobra.dev/
# The pattern to follow is
# APPNAME VERB NOUN --ADJECTIVE. or
# APPNAME COMMAND ARG --FLAG
module Help
  class HelpComm < ClassComm
    attr_accessor :name, :desc
    attr_accessor :cmds, :subcmds, :args, :flags

    include Help::P

    # https://cobra.dev/#example-1
    def initialize(name, desc)
      # The rootcmds
      # add         Add a command to a Cobra Application
      @cmds = []
      @subcmds = []

      # -a, --author string    author name for copyright attribution (default "YOUR NAME")
      @flags = []

      # git clone URL --bare
      # the URL is arg
      @args = []

      @name = name
      @desc = desc
    end

    def add_cmd(obj)
      if obj != nil
        cmd = {}
        cmd.store :use, obj[:use]
        cmd.store :s_desc, obj[:s_desc]
        cmd.store :l_desc, obj[:l_desc]
        cmd.store :run, obj[:run]
        @cmds.push cmd
      end
    end

    def add_subcmd(obj)
      if obj != nil
        cmd = {}
        cmd.store :use, obj[:use]
        cmd.store :s_desc, obj[:s_desc]
        cmd.store :l_desc, obj[:l_desc]
        cmd.store :run, obj[:run]
        @subcmds.push cmd
      end
    end

    def add_flag(obj)
      if obj != nil
        flag = {}
        flag.store :s_use, obj[:s_use]
        flag.store :l_use, obj[:l_use]
        flag.store :desc, obj[:desc]
        flag.store :default, obj[:default]
        flag.store :run, obj[:run]
        @flags.push flag
      end
    end
  end
end
