defmodule HttpPoisonTest do
  use ExUnit.Case
  doctest HttpPoison

  test "greets the world" do
    assert HttpPoison.hello() == :world
  end
end
