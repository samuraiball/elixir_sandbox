defmodule ParameterizedTestTest do
  use ExUnit.Case, async: true
  use ExUnit.Parameterized

  alias ParameterizedTest

  test "greets the world" do
    assert ParameterizedTest.Calc.sum(1, 2) == 3
  end

  test_with_params "param test",
                   fn a, b, expected ->
                     assert ParameterizedTest.Calc.sum(a, b) == expected
                   end do
    [
      {1, 2, 3},
      {3, 3, 7},
      {1, 2, 3}
    ]
  end
end
