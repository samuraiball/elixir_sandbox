defmodule WebApiSample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the PubSub system
      {Phoenix.PubSub, name: WebApiSample.PubSub}
      # Start a worker by calling: WebApiSample.Worker.start_link(arg)
      # {WebApiSample.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: WebApiSample.Supervisor)
  end
end
