defmodule ApiPhoenix.PageController do
  use ApiPhoenix.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
