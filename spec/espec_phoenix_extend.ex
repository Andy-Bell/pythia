defmodule ESpec.Phoenix.Extend do
  def model do
    quote do
      alias Pythia.Repo
    end
  end

  def controller do
    quote do
      alias Pythia.Repo
      import Pythia.Router.Helpers
    end
  end

  def request do
    quote do
      alias Pythia.Repo
      import Pythia.Router.Helpers
    end
  end

  def view do
    quote do
      import Pythia.Router.Helpers
    end
  end

  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
