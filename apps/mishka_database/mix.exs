defmodule MishkaDatabase.MixProject do
  use Mix.Project

  def project do
    [
      app: :mishka_database,
      version: "0.0.2",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      aliases: aliases(),
      lockfile: "../../mix.lock",
      elixir: "~> 1.13",
      compilers: [:gettext | Mix.compilers()],
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :mishka_translator, :phoenix_pubsub],
      mod: {MishkaDatabase.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mishka_developer_tools, "~> 0.0.6"},
      {:comeonin, "~> 5.3"},
      {:bcrypt_elixir, "~> 2.3"},
      {:ecto_enum, "~> 1.4"},
      {:jason, "~> 1.2"},
      {:scrivener_ecto, "~> 2.7"},
      {:mishka_translator, in_umbrella: true}
    ]
  end

  defp aliases do
    [
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
