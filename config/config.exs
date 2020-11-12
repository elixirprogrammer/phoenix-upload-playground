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

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
