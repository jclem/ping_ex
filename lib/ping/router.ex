defmodule Ping.Router do
  use Plug.Router

  if Mix.env !== :test, do: plug(Plug.Logger)
  plug(:match)
  plug(:dispatch)

  get "/ping" do
    {:ok, vsn} = :application.get_key(:ping, :vsn)
    send_resp(conn, Plug.Conn.Status.code(:ok), "pong from v#{vsn}")
  end

  match _ do
    send_resp(conn, Plug.Conn.Status.code(:not_found), "Not found")
  end
end
