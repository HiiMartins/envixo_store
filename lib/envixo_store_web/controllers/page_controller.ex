defmodule EnvixoStoreWeb.PageController do
  use EnvixoStoreWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
