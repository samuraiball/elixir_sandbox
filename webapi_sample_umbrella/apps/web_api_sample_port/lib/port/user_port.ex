defmodule WebApiSamplePort.UserPort do
  alias WebApiSampleDomain.{User, Users}
  @callback save(User.t()) :: :ok
  @callback find_all() :: {:ok, Users.t()}
  @callback find_by(String.t()) :: {:ok, User.t()}
  @callback delete(String.t()) :: :ok
end
