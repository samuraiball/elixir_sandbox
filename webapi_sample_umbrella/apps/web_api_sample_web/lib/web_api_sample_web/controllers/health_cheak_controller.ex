defmodule WebApiSampleWeb.HealthCheakController do
  use WebApiSampleWeb, :controller

  def health(conn, _params) do
    json(conn, %{status: "ok"})
  end
end
