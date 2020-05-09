defmodule WebApiSampleGateway.UserGateway do
  alias WebApiSampleDriver.UserSchema
  alias WebApiSampleDomain.User

  @behaviour WebApiSamplePort.UserPort

  @user_driver Application.get_env(:web_api_sample_base, :user_driver)

  def save(target_user) do
    @user_driver.save(%UserSchema{
      user_id: target_user.id,
      user_name: target_user.user_name,
      mail: target_user.mail
    })
  end

  def find_all() do
    case @user_driver.find_all() do
      {:ok, users_schema} ->
        {:ok,
         Enum.map(users_schema, &%User{id: &1.user_id, user_name: &1.user_name, mail: &1.mail})}
    end
  end

  def find_by(id) do
    user_schema = @user_driver.find_by(id)
    {:ok, %User{id: user_schema.user_id, user_name: user_schema.user_name, mail: user_schema.mail}}
  end

  def delete(id) do
    @user_driver.delete(id)
  end
end
