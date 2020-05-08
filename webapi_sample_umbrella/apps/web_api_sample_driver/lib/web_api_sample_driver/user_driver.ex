defmodule WebApiSampleDriver.UserDriverBehaior do
  alias WebApiSampleDriver.UserSchema
  @callback save(target_user_schema :: UserSchema.t()) :: :ok
  @callback find_all() :: {:ok, [UserSchema.t()]}
end

require Logger

defmodule WebApiSampleDriver.UserDriver do
  @behaviour WebApiSampleDriver.UserDriverBehaior

  alias WebApiSampleDriver.Repo
  alias WebApiSampleDriver.UserSchema

  def save(target_user_schema) do
    case Repo.insert(target_user_schema) do
      {:ok, _} ->
        :ok

      error ->
        error
    end
  end

  def find_all() do
      {:ok, Repo.all(UserSchema)}
  end
end
