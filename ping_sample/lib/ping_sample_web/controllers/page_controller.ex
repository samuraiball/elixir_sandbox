defmodule PingSampleWeb.PageController do
  use PingSampleWeb, :controller

  def index(conn, _params) do
    json(conn, %{status: "ok"})
  end
end
