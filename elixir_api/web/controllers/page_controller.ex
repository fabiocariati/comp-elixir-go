defmodule ElixirApi.PageController do
  use ElixirApi.Web, :controller

  def index(conn, _params) do
      users = []
      json conn, users
  end
end
