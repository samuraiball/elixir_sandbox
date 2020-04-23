defmodule SomeService do
  @behaviour ServiceBehaviour

  def doSomething do
    IO.puts "this is a service"
  end
end


defmodule MockService do
  @behaviour ServiceBehaviour

  def doSomething do
    IO.puts "this is a mock"
  end
end
