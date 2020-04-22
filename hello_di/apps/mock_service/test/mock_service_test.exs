defmodule MockServiceTest do
  use ExUnit.Case
  doctest MockService

  test "greets the world" do
    assert MockService.hello() == :world
  end
end
