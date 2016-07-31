defmodule Pythia.SearchController do
  use Pythia.Web, :controller
  alias Pythia.Query


  def index(conn, _params) do
    render conn, "index.html"
  end

  def create(conn, %{"search" => search_params}) do
    conn
    |> assign(:search_result, Query.split_string(search_params["search"]))
    |> render("index.html")
  end

end
