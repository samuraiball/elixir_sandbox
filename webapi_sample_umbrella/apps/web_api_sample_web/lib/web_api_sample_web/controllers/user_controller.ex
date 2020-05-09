defmodule WebApiSampleWeb.UserController do
  use WebApiSampleWeb, :controller
  alias WebApiSampleDomain.{User}

  @user_usecase Application.get_env(:web_api_sample_base, :user_usecase)

  require Logger

  def get(conn, %{"id" => id}) do
    case @user_usecase.find(id) do
      {:ok, user} ->
        response = %{"id" => user.id, "user_name" => user.user_name, "mail" => user.mail}

        conn
        |> put_status(:ok)
        |> json(response)
    end
  end

  def find_all(conn, _params) do
    case @user_usecase.find_all() do
      {:ok, users} ->
        response = %{
          "user_list" =>
            Enum.map(users, &%{"id" => &1.id, "user_name" => &1.user_name, "mail" => &1.mail})
        }

        conn
        |> put_status(:ok)
        |> json(response)
    end
  end

  def create(conn, params) do
    target_user = %User{
      id: UUID.uuid4(:hex),
      user_name: params["user_name"],
      mail: params["mail"]
    }

    case @user_usecase.save(target_user) do
      :ok ->
        conn
        |> put_status(:created)
        |> json(%{"status" => "created"})
    end
  end

  def update(conn, params) do
    target_user = %User{id: params["id"], user_name: params["user_name"], mail: params["mail"]}
    @user_usecase.update(target_user)

    conn
    |> put_status(:ok)
    |> json(%{"status" => "ok"})
  end

  def delete(conn, params) do
    @user_usecase.delete(params["id"])

    conn
    |> put_status(:no_content)
    |> json(%{"status" => "no content"})
  end
end
