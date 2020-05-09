defmodule WebApiSampleDriver.UserDriverBehaior do
  alias WebApiSampleDriver.UserSchema
  @callback save(target_user_schema :: UserSchema.t()) :: :ok
  @callback find_all() :: {:ok, [UserSchema.t()]}
  @callback find_by(String.t()) :: {:ok, [UserSchema.t()]}
end

require Logger

defmodule WebApiSampleDriver.UserDriver do
  @behaviour WebApiSampleDriver.UserDriverBehaior

  alias WebApiSampleDriver.Repo
  alias WebApiSampleDriver.UserSchema

  def save(target_user_schema) do
    case Repo.get(UserSchema, target_user_schema.user_id) do
      nil -> target_user_schema
      user -> user
    end
    |> UserSchema.changeset(Map.from_struct(target_user_schema))
    |> Repo.insert_or_update()

    :ok
  end

  def find_all() do
    {:ok, Repo.all(UserSchema)}
  end

  def find_by(id) do
    Repo.get(UserSchema, id)
  end
end
