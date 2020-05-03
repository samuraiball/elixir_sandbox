defmodule WebApiSampleWeb.Router do
  use WebApiSampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WebApiSampleWeb do
    pipe_through :api
  end
end
