defmodule UserUsecase.UserUsecaseBehaviour do
  alias WebApiSampleDomain.{User}
  @callback find(id :: String.t()) :: {:ok, User}
end

defmodule UserUsecase.User do
  alias WebApiSampleDomain.{User}

  @behaviour UserUsecase.UserUsecaseBehaviour
  def find(id) do
    {:ok, %User{id: nil, user_name: nil, mail: nil}}
  end
end
