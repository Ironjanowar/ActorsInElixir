defmodule InterestingProcessTest do
  use ExUnit.Case
  doctest InterestingProcess

  test "greets the world" do
    assert InterestingProcess.hello() == :world
  end
end
