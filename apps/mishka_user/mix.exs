defmodule MishkaUser.MixProject do
  use Mix.Project

  def project do
    [
      app: :mishka_user,
      version: "0.0.2",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
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
      extra_applications: [:logger, :phoenix, :jose, :mishka_database],
      mod: {MishkaUser.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mishka_installer, "~> 0.0.3"},
      {:mishka_database, in_umbrella: true},
      {:mishka_translator, in_umbrella: true},
      {:plug, "~> 1.12"},
      {:guardian, "~> 2.2"},
      {:phoenix, "~> 1.6", override: true},
      {:jose, "~> 1.11"},
      {:finch, "~> 0.12.0"}
    ]
  end
end
