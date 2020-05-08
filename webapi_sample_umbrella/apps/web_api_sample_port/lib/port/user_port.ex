defmodule WebApiSamplePort.UserPort do
  alias WebApiSampleDomain.{User, Users}
  @callback save(target_user :: User.t()) :: :ok
  @callback find_all() :: {:ok, Users.t()}
end
