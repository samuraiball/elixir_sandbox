# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ping_sample,
  ecto_repos: [PingSample.Repo]

# Configures the endpoint
config :ping_sample, PingSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pIe3avRVLqcMrbTiTVs1E9QOav0NGTF7LTXMDpq72oTrhJFtPcodn6ePto6EAt8j",
  render_errors: [view: PingSampleWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PingSample.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [signing_salt: "hBixyInD"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
