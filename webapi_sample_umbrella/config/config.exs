# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

config :web_api_sample_web,
  generators: [context_app: :web_api_sample]

# Configures the endpoint
config :web_api_sample_web, WebApiSampleWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "/Uz/6/Mzg1bD/cJ9uui4L7WDZ6uTwv64oUUF7sIEB5wba0L8XEbBTQFlpo8cPC4D",
  render_errors: [view: WebApiSampleWeb.ErrorView, accepts: ~w(json), layout: false],
  # pubsub_server: WebApiSample.PubSub,
  live_view: [signing_salt: "BfqJ0sDo"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# DI

case Mix.env() do
  :test ->
    config :user_usecase,
      find: UserUsecase.UserUsecaseMock

  _ ->
    config :user_usecase,
      find: UserUsecase.UserUsecaseMock
end

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
