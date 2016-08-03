defmodule Pythia.ExampleModelSpec do
  use ESpec.Phoenix, model: Pythia.Example

  let :example, do: %Pythia.Example{title: "Example 1"}
  it do: example.title |> should(eq "Example 1")
end
