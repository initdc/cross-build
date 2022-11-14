module Help
  module P
    @cmd_use = 16
    @flag_s_use = 4
    @flag_l_use = 16

    def self.get_sym(sym)
      return P::instance_variable_get(sym)
    end

    def self.set_sym(sym, val)
      return P::instance_variable_set(sym, val)
    end

    def self.len(str, len)
      if str.length > len
        len = str.length
      end
      return len - str.length
    end

    def self.len_sym(str, sym)
      if str.length > P.get_sym(sym)
        P.set_sym(sym, str.length)
      end
      return P.get_sym(sym) - str.length
    end

    def self.sp(str, len)
      t = P.len str, len
      return str + " " * t
    end

    def self.sp_sym(str, sym)
      t = P.len_sym str, sym
      return str + " " * t
    end

    def p_desc
      puts @desc
    end

    def p_usage
      puts
      puts "Usage:"
      puts "  #{@name} [command]"
    end

    def p_cmds
      puts
      puts "Available Commands:"

      if @debug
        puts :@cmd_use.class
        puts @cmd_use.class
        puts ":@cmd_use".to_sym
        puts "@cmd_use".to_sym
        puts ":@cmd_use".to_sym == :@cmd_use
        puts "@cmd_use".to_sym == :@cmd_use
        p Help::P::instance_variables
        p Help::P::instance_variable_get :@cmd_use
        p Help::P::instance_variable_get "@cmd_use"
        p P.get_sym :@cmd_use
        p P.get_sym "@cmd_use"
      end

      @cmds.each do |cmd|
        P.len_sym cmd[:use], :@cmd_use
      end

      @cmds.each do |cmd|
        use = P.sp_sym cmd[:use], :@cmd_use
        puts "  #{use}  #{cmd[:s_desc]}"
      end
    end

    def p_subcmds
      @subcmds.each do |subcmd|
        P.len_sym subcmd.name, :@cmd_use
      end

      @subcmds.each do |subcmd|
        use = P.sp_sym subcmd.name, :@cmd_use
        puts "  #{use}  #{subcmd.desc}"
      end
    end

    def p_flags
      puts
      puts "Flags:"

      @flags.each do |flag|
        P.len_sym flag[:s_use], :@flag_s_use
        P.len_sym flag[:l_use], :@flag_l_use
      end

      @flags.each do |flag|
        short = P.sp_sym flag[:s_use], :@flag_s_use
        long = P.sp_sym flag[:l_use], :@flag_l_use
        puts "  #{short},#{long}  #{flag[:desc]}"
      end
    end

    def p_more
      puts
      puts "Use \"#{@name} [command] --help\" for more information about a command."
    end
  end
end
