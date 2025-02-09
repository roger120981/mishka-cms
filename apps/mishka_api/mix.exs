defmodule MishkaApi.MixProject do
  use Mix.Project

  def project do
    [
      app: :mishka_api,
      version: "0.0.2",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.13",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {MishkaApi.Application, []},
      extra_applications: [
        :logger,
        :runtime_tools,
        :mishka_translator,
        :mishka_user,
        :plug,
        :mishka_content,
        :mishka_html
      ]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6", override: true},
      {:phoenix_live_dashboard, "~> 0.5"},
      {:telemetry_metrics, "~> 0.6"},
      {:telemetry_poller, "~> 0.5"},
      {:jason, "~> 1.2"},
      {:plug_cowboy, "~> 2.5"},
      {:mishka_user, in_umbrella: true},
      {:mishka_content, in_umbrella: true},
      {:mishka_html, in_umbrella: true},
      {:plug, "~> 1.11"},
      {:mishka_translator, in_umbrella: true},
      {:sobelow, "~> 0.11.1", only: :dev},
      {:mishka_installer, "~> 0.0.3"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      setup: ["deps.get"]
    ]
  end
end
