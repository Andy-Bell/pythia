defmodule QuerySpec do
  use ESpec

  let :list_back do
    [%{title: "Makers Academy", description: "Learn to code", url: "http://www.makersacademy.com"},
     %{title: "Code Academy", description: "Here you can code", url: "http://www.codeacademy.com"}]
   end

  before do
    allow(Pythia.Repo).to accept(:all, fn(x) -> list_back end)
  end

  it "calls Pythia.Ranking when split_string is run" do
    allow(Pythia.Ranking).to accept(:ranked_list, fn(a, b) -> list_back end)
    Pythia.Query.list_search_results("code")
    expect Pythia.Ranking
    |> to(accepted :ranked_list, [list_back, "code"])
  end

  it "calls Pythia.Ranking with correct arguments" do
    allow(Pythia.Ranking).to accept(:ranked_list, fn(a, b) -> Enum.reverse(list_back) end)
    expect Pythia.Query.list_search_results("makers")
    |> to(eq Enum.reverse(list_back))
  end

  it "makes a call to Pythia.Repo" do
    Pythia.Query.list_search_results("code")
    expect Pythia.Repo
    |> to(accepted :all)
  end

end
