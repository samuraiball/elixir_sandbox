defmodule WebApiSampleBase.Case do
  import Mox
  use ExUnit.CaseTemplate

  using do
    quote do
      import Mox
    end
  end

  setup :verify_on_exit!
end
