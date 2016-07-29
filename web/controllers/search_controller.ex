defmodule Pythia.SearchController do
  use Pythia.Web, :controller
  alias Pythia.Search

  def index(conn, _params) do
    changeset = Search.changeset(%Search{})
    render conn, "index.html", changeset: changeset
  end

  def create(conn, %{"search" => search_params}) do
    changeset = Search.changeset(%Search{})
    render conn,"index.html", changeset: changeset
  end
end

