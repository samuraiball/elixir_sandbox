defmodule EnumErrorHandlingTest do
  use ExUnit.Case, async: false
  import Mock

  test "success" do
    with_mock EnumErrorHandling.DoSomething,
      do_something: fn value ->
        {:ok, value <> ": did something"}
      end do
      some_list = ["value1", "value2", "value3"]

      assert {:ok, ["value1: did something", "value2: did something", "value3: did something"]} ==
               EnumErrorHandling.hello_reduce_while(some_list)
    end
  end

  test "failed" do
    with_mock EnumErrorHandling.DoSomething,
      do_something: fn value ->
        case value do
          "value2" ->
            :error
          _ ->
            {:ok, value <> ": did something"}
        end
      end do
      some_list = ["value1", "value2", "value3"]

      assert EnumErrorHandling.hello_reduce_while(some_list) == :error
    end
  end
end
