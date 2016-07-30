defmodule Pythia.SearchController do
  use Pythia.Web, :controller
  alias Pythia.Query
  alias Pythia.Search
  alias Pythia.Data


  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{"search" => search_params}) do
    conn
     |> assign(:result, "#{Query.database_search(search_params["search"])}")
     |> render("index.html")
  end

end
