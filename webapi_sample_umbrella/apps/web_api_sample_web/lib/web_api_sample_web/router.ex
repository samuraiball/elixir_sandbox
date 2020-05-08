defmodule WebApiSampleWeb.Router do
  use WebApiSampleWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", WebApiSampleWeb do
    pipe_through :api
    get "/health", HealthCheakController, :health
    get "/user/list", UserController, :find_all
    get "/user/:id", UserController, :get
    post "/user", UserController, :create
  end
end
