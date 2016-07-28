defmodule Pythia.PageController do
  use Pythia.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
