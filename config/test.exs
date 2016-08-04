use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :pythia, Pythia.Endpoint,
  http: [port: 4000],
  server: true

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :pythia, Pythia.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "delphi_test",
  pool: Ecto.Adapters.SQL.Sandbox
