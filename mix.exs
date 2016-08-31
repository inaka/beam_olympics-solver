defmodule Boss.Mixfile do
  use Mix.Project

  def project do
    [app: :boss,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    [
      {:exrm, "~> 1.0"},
      {:credo, "~> 0.4", only: [:dev, :test]}
    ]
  end
end
