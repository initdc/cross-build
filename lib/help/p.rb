module Help
  module P
    @@cmd_short = 16
    @@flag_short = 6
    @@flag_long = 20

    def self.get_sym(sym)
      return P::class_variable_get(sym)
    end

    def self.set_sym(sym, val)
      return P::class_variable_set(sym, val)
    end

    def self.len(str, len)
      if str.length > len - 2
        len = str.length + 2
      end
      return len - str.length
    end

    def self.len_sym(str, sym)
      if str.length > P.get_sym(sym) - 2
        P.set_sym(sym, str.length + 2)
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
        puts :@@cmd_short.class
        puts @@cmd_short.class
        puts ":@@cmd_short".to_sym
        puts "@@cmd_short".to_sym
        puts ":@@cmd_short".to_sym == :@@cmd_short
        puts "@@cmd_short".to_sym == :@@cmd_short
        p Help::P::class_variables
        p Help::P::class_variable_get :@@cmd_short
        p Help::P::class_variable_get "@@cmd_short"
        p P.get_sym :@@cmd_short
        p P.get_sym "@@cmd_short"
      end

      @cmds.each do |cmd|
        short = P.sp_sym cmd[:use], :@@cmd_short
        puts "  #{short}#{cmd[:short]}"
      end
    end
  end
end
