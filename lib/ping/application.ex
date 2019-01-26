defmodule Ping.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    port = get_port(Application.get_env(:ping, :port))

    # List all child processes to be supervised
    children = [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http,
        plug: Ping.Router,
        options: [port: port]
      )
      # Starts a worker by calling: Ping.Worker.start_link(arg)
      # {Ping.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ping.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp get_port(port) when is_integer(port), do: port
  defp get_port(port) when is_binary(port), do: String.to_integer(port)
  defp get_port({:system, key}), do: get_port(System.get_env(key))
end
