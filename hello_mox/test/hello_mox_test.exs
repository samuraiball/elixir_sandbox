defmodule HelloMoxTest do
  import Mox
  use ExUnit.Case
  doctest HelloMox

  test "Moxでもっくをりようしてみるテストだよぉ" do
    Service.GreetingMock
    |> expect(:greeting, fn -> 'Hello, Mox' end)

    HelloMox.run()
  end
end
