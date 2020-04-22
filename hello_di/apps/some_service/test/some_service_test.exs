defmodule SomeServiceTest do
  use ExUnit.Case
  doctest SomeService

  test "greets the world" do
    assert SomeService.hello() == :world
  end
end
