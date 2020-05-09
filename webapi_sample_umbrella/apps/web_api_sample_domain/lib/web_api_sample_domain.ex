defmodule WebApiSampleDomain.User do
  @type t :: %__MODULE__{}
  defstruct [:id, :user_name, :mail]

  def update(user, update_user) do
    user
    |> update_name(update_user.user_name)
    |> update_mail(update_user.mail)
  end

  defp update_name(user, update_user_name) do
    case update_user_name do
      nil -> user
      _ -> %{user | user_name: update_user_name}
    end
  end

  defp update_mail(user, update_user_mail) do
    case update_user_mail do
      nil -> user
      _ -> %{user | mail: update_user_mail}
    end
  end
end

defmodule WebApiSampleDomain.Users do
  alias WebApiSampleDomain.User
  @type t :: [User.t()]
end
