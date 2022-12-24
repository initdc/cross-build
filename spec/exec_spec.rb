# frozen_string_literal: true

RSpec.describe Exec do
  it "run cmd got nil" do
    expect(Exec::run "uname").to be nil
  end

  it "system cmd got true" do
    expect(Exec::code "uname").to eq true
  end

  it "system cmd got nil" do
    expect(Exec::code "unamea").to be nil
  end

  it "system cmd got false" do
    expect(Exec::code "exit 1").to eq false
  end

  it "system cmd got false" do
    expect(Exec::code "exit 99", 99).to eq false
  end

  it "each_line cmd got array" do
    arr = []
    Exec::each_line "ls -1 bin" do |line|
      res = line.delete_suffix("\n")
      p res
      arr.push res
    end

    expect(arr).to eq ["console", "setup"]
  end

  it "output cmd got 'Linux'" do
    expect(Exec::output "uname").to eq "Linux"
  end
end
