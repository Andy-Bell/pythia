defmodule Pythia.PageViewTest do
	use Hound.Helpers
  alias Pythia.Repo
  use ExUnit.Case, async: true

  hound_session

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Pythia.Repo)
  end

  :ok

	test "GET /" do
		navigate_to "/"
    assert page_source =~ "Pythia"
	end

  test "search" do
    navigate_to "/"
    search_field = find_element(:tag, "main")

    search_field
    |> find_within_element(:class, "form-control")
    |> fill_field("code")

    search_field
    |> find_within_element(:class, "btn")
    |> click

    assert element_displayed?({:class, "result"})

  end

end
