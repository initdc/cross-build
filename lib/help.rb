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
      cmd = {}
      cmd.store :use, obj[:use]
      cmd.store :short, obj[:short]
      cmd.store :long, obj[:long]
      cmd.store :run, obj[:run]
      @cmds.push cmd
    end

    def add_subcmd(obj)
      cmd = {}
      cmd.store :use, obj[:use]
      cmd.store :short, obj[:short]
      cmd.store :long, obj[:long]
      cmd.store :run, obj[:run]
      @subcmds.push cmd
    end

    def add_flag(obj)
      flag = {}
      flag.store :use, obj[:use]
      flag.store :short, obj[:short]
      flag.store :long, obj[:long]
      flag.store :default, obj[:default]
      @flags.push flag
    end
  end
end
