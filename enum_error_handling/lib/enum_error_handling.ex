defmodule EnumErrorHandling do

  alias EnumErrorHandling.DoSomething

  require Logger

  def hello_reduce_while(some_collection) do
    Enum.reduce_while(some_collection, {:ok, []}, fn value, {:ok, acc} ->
      case DoSomething.do_something(value) do
        {:ok, new_value} -> {:cont, {:ok, [new_value | acc]}}
        :error = err -> {:halt, err}
      end
    end)
    |> case do
      {:ok, new_collection} -> {:ok, Enum.reverse(new_collection) }
      :error ->
        Logger.error("something hannpend")
        :error
    end
  end
end

defmodule EnumErrorHandling.DoSomething do

  def do_something(value) do
    # エラーが発生する可能性がある何かの処理をする
    value
  end
end
