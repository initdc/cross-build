# frozen_string_literal: true

require_relative "exec"

Exec::info = false

p Exec::run("uname") == nil
p Exec::code("uname") == true
p Exec::code("unamea") == nil
p Exec::code("exit 1") == false
p Exec::output("uname") == "Linux"

Exec::code("exit 2", 99)
