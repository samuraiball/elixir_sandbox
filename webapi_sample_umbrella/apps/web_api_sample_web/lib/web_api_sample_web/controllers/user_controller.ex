defmodule WebApiSampleWeb.UserController do
  use WebApiSampleWeb, :controller
  require Logger

  def get(conn, %{"id" => id}) do
    Logger.info("UserId: #{id}")

    conn
    |> put_status(:created)
    |> json(%{status: "ok"})

  end
end
