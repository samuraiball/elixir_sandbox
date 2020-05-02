defmodule Service.GreetingBehaviour do
  @callback greeting() :: charlist()
end

defmodule Service.GreetingJapanese do
  @behaviour Service.GreetingBehaviour
  def greeting() do
    'こんにちは'
  end
end
