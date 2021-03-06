defmodule Pythia.Router do
  use Pythia.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Pythia do
    pipe_through :browser # Use the default browser stack

    get "/", SearchController, :index
    resources "/search", SearchController, only: [:index, :new, :create, :show]
  end


  # Other scopes may use custom stacks.
  # scope "/api", Pythia do
  #   pipe_through :api
  # end
end
