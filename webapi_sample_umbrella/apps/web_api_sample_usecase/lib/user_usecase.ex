defmodule WebApiSampleUsecase.UserUsecaseBehaviour do
  alias WebApiSampleDomain.{User, Users}
  @callback find(id :: String.t()) :: {:ok, User.t()}
  @callback save(targetUser :: User.t()) :: :ok
  @callback find_all() :: {:ok, Users.t()}
end

defmodule WebApiSampleUsecase.UserUsecase do
  @behaviour WebApiSampleUsecase.UserUsecaseBehaviour

  @user_gayteway Application.get_env(:web_api_sample_base, :user_gateway)

  def find(id) do
    @user_gayteway.find_by(id)
  end

  def find_all() do
    @user_gayteway.find_all()
  end

  def save(targetUser) do
    @user_gayteway.save(targetUser)
  end
end
