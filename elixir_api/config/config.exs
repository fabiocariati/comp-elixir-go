# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elixir_api,
  ecto_repos: [ElixirApi.Repo]

# Configures the endpoint
config :elixir_api, ElixirApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "8Z2qD7iHC5hf/AzPWZ4K2+mmoBkhuQsqKAILAoZvLuLqMUv1ooJWqn6lMfjj2SDO",
  render_errors: [view: ElixirApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: ElixirApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :elixir_api, ElixirApi.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "elixir_api",
  hostname: "mysql",
  pool_size: 10

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
