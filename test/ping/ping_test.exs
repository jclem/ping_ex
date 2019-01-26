defmodule Ping.RouterTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @opts Ping.Router.init([])

  test "GET /ping returns a pong" do
    conn = conn(:get, "/ping") |> Ping.Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 200
    assert conn.resp_body == "pong"
  end

  test "returns a 404 from an unmatched route" do
    conn = conn(:get, "/pong") |> Ping.Router.call(@opts)

    assert conn.state == :sent
    assert conn.status == 404
    assert conn.resp_body == "Not found"
  end
end
