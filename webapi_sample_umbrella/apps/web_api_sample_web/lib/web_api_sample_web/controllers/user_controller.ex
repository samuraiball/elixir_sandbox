defmodule WebApiSampleWeb.UserController do
  use WebApiSampleWeb, :controller

  @user_usecase Application.get_env(:user_usecase, :find)

  require Logger

  def get(conn, %{"id" => id}) do
    case @user_usecase.find(id) do
      {:ok, user} ->

        response =
            %{"id" => user.id, "user_name" => user.user_name, "mail" => user.mail}

        conn
        |> put_status(:ok)
        |> json(response)
    end
  end
end
