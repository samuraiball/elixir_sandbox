defmodule HelloDiTest do
  use ExUnit.Case
  doctest HelloDi

  test "greets the world" do
    assert HelloDi.hello() == :world
  end
end
