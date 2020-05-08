defmodule WebApiSampleDriver.Repo do
  use Ecto.Repo,
    otp_app: :web_api_sample_driver,
    adapter: Ecto.Adapters.Postgres
end
