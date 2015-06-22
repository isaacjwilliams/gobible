defmodule CliTest do
  
  use ExUnit.Case
  
  import Issues.CLI, only: [ parse_args: 1 ]
  
  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end
  
  test "three values returned if three given" do
    assert parse_args(["james", "1", "1"]) == { "james", "1", "1" }
  end

end
