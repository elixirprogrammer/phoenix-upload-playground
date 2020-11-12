# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :upload_playground,
  ecto_repos: [UploadPlayground.Repo]

# Configures the endpoint
config :upload_playground, UploadPlaygroundWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "cGWhzbbaT4Etc8u9oW1LtBWG4odspsASJ1BSKbMueD9ZK9lJCIxwepGcuOtDBqkW",
  render_errors: [view: UploadPlaygroundWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: UploadPlayground.PubSub,
  live_view: [signing_salt: "oOaLh2fY"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

config :waffle,
  storage: Waffle.Storage.S3, # or Waffle.Storage.Local
  bucket: System.get_env("AWS_BUCKET_NAME") # if using S3

# If using S3:
config :ex_aws,
  json_codec: Jason,
  access_key_id: System.get_env("AWS_ACCESS_KEY_ID"),
  secret_access_key: System.get_env("AWS_SECRET_ACCESS_KEY"),
  region: System.get_env("AWS_REGION")

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
