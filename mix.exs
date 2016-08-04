defmodule Pythia.Mixfile do
  use Mix.Project

  def project do
    [app: :pythia,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases(),
     deps: deps(),
     preferred_cli_env: [espec: :test]]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Pythia, []},
     applications: app_list(Mix.env)]
  end

  def app_list do
    [:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext,
                   :phoenix_ecto, :postgrex]
  end

  def app_list(:test), do: [:hound | app_list]
  def app_list(_), do: app_list

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.2.0"},
      {:phoenix_pubsub, "~> 1.0"},
      {:phoenix_ecto, "~> 3.0"},
      {:postgrex, ">= 0.0.0"},
      {:phoenix_html, "~> 2.6"},
      {:phoenix_live_reload, "~> 1.0", only: :dev},
      {:gettext, "~> 0.11"},
      {:cowboy, "~> 1.0"},
      {:hound, "~> 1.0", only: :test},
      {:espec, "~> 0.8.28", only: :test},
      {:espec_phoenix, "~> 0.3.0", only: :test, app: false}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      "test": ["ecto.create --quiet", "ecto.migrate", "test", "espec"],
      "server.start": ["deps.get", "deps.compile", "compile", "phoenix.server"],
      "routes": ["phoenix.routes"]
    ]
  end
end
