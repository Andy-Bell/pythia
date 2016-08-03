defmodule Pythia.ExampleControllerSpec do
  use ESpec.Phoenix, controller: Pythia.ExampleController

  describe "index" do
    let :examples do
      [
        %Pythia.Example{title: "Example 1"},
        %Pythia.Example{title: "Example 2"},
      ]
    end

    before do
      allow(Pythia.Repo).to accept(:all, fn -> examples end)
    end

    subject do: action :index

    it do: should be_successful
    it do: should have_in_assigns(examples: examples)
  end
end
