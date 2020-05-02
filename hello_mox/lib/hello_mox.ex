defmodule HelloMox do
  @service Application.get_env(:hello_mox, :greeting)

  def run() do
   IO.puts  @service.greeting()
  end
end
