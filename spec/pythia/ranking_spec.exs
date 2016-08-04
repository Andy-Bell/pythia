defmodule RankingSpec do
  use ESpec

  context "sorts a list" do
    let :test_list do
      [%{title: "Makers Academy", description: "Learn to code", url: "http://www.makersacademy.com"},
       %{title: "Code Academy", description: "Here you can code", url: "http://www.codeacademy.com"}]
    end

    let :nil_list do
      [%{title: "Makers Academy", description: "Learn to code", url: "http://www.makersacademy.com"},
       %{title: "Code Academy", description: "Here you can code", url: "http://www.codeacademy.com"},
       nil,
       %{title: nil, description: nil, url: "http://www.reddit.com"}]
    end


    it "sorts a list by the correct assigned score with keyword code" do
      expect Pythia.Ranking.ranked_list(test_list, "code")
      |> not_to(eq test_list)
    end

    it "sorts a list by the correct assigned score with keyword makers" do
      expect Pythia.Ranking.ranked_list(test_list, "makers")
      |> to(eq test_list)
    end

    it "does not throw error when encounters nil values" do
      expect(fn -> Pythia.Ranking.ranked_list(nil_list, "code") end)
      |> not_to(raise_exception)
    end
  end

end
