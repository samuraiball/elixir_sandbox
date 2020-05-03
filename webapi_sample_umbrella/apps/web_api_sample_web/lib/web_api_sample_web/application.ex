defmodule WebApiSampleWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      WebApiSampleWeb.Telemetry,
      # Start the Endpoint (http/https)
      WebApiSampleWeb.Endpoint
      # Start a worker by calling: WebApiSampleWeb.Worker.start_link(arg)
      # {WebApiSampleWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: WebApiSampleWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    WebApiSampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
