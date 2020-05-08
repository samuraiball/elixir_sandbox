defmodule WebApiSampleUsecase.UserUsecaseBehaviour do
  alias WebApiSampleDomain.{User}
  @callback find(id :: String.t()) :: {:ok, User}
  @callback save(targetUser :: User) :: :ok
end

defmodule WebApiSampleUsecase.UserUsecase do
  alias WebApiSampleDomain.{User}
  @behaviour WebApiSampleUsecase.UserUsecaseBehaviour

  @user_gayteway Application.get_env(:web_api_sample_base, :user_gateway)

  def find(id) do
    {:ok, %User{id: id, user_name: nil, mail: nil}}
  end

  def save(targetUser) do
    @user_gayteway.save(targetUser)
  end
end
