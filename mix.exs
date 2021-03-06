defmodule Ping.MixProject do
  use Mix.Project

  @vsn "1.0.2"

  def project do
    [
      app: :ping,
      version: @vsn,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Ping.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:cowboy, "~> 2.6.1"},
      {:plug, "~> 1.7.1"},
      {:plug_cowboy, "~> 2.0.1"},
      {:distillery, "~> 2.0.12"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
    ]
  end
end
