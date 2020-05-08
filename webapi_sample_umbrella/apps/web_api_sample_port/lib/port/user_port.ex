defmodule WebApiSamplePort.UserPort do
  alias WebApiSampleDomain.User
  @callback save(target_user :: User) :: :ok
end
