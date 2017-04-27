use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :elixir_api, ElixirApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :elixir_api, ElixirApi.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  password: "root",
  database: "elixir_api_test",
  hostname: "mysql",
  pool: Ecto.Adapters.SQL.Sandbox
