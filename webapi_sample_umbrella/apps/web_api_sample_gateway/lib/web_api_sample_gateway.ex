defmodule WebApiSampleGateway.UserGateway do
  @behaviour WebApiSamplePort.UserPort
  def save(user) do
    :ok
  end
end
