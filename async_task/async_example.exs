defmodule AsyncExample do
  alias Chores.{FirstTask, SecondTask}

  def do_tasks do
    [
      fn -> FirstTask.do_something end,
      fn -> SecondTask.do_something end,
    ]
    |> Enum.map(&Task.async(&1))
    |> Enum.each(fn t ->
      Task.await(t)
      |> IO.puts
    end)
  end
  nil
end


defmodule Chores.FirstTask do
  def do_something do
    :timer.sleep(3000)
    IO.puts "finised first task after wating 3s"
    "sleeped 3s"
  end
end


defmodule Chores.SecondTask do
  def do_something do
    :timer.sleep(2000)
    IO.puts "finised second task after wating 2s"
    "sleeped 2s"
  end
end

AsyncExample.do_tasks
