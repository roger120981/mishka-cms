defmodule MishkaContent.MixProject do
  use Mix.Project

  def project do
    [
      app: :mishka_content,
      version: "0.0.2",
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      elixir: "~> 1.13",
      compilers: [:gettext | Mix.compilers()],
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      xref: [
        exclude: [MishkaUser.User, MishkaInstaller.Hook]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [
        :logger,
        :ecto_sql,
        :ecto,
        :mishka_database,
        :phoenix_pubsub,
        :mishka_translator,
        :bamboo,
        :bamboo_smtp,
        :phoenix_html,
        :mishka_installer
      ],
      mod: {MishkaContent.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mishka_installer, "~> 0.0.3"},
      {:mishka_database, in_umbrella: true},
      {:mishka_user, in_umbrella: true},
      {:bamboo, "~> 2.2"},
      {:bamboo_smtp, "~> 4.2"},
      {:bamboo_phoenix, "~> 1.0"},
      {:timex, "~> 3.7"},
      {:mishka_translator, in_umbrella: true}
    ]
  end
end
