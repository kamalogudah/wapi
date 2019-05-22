defmodule WapiWeb.PageController do
  use WapiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
