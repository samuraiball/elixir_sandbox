defmodule WebApiSampleDriverTest do
  use ExUnit.Case
  doctest WebApiSampleDriver

  test "greets the world" do
    assert WebApiSampleDriver.hello() == :world
  end
end
