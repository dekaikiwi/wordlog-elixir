defmodule WordlogElixer.Api.ListView do
  use WordlogElixer.Web, :view

  def render("index.json", %{lists: lists}) do
    lists
  end

  def render("show.json", %{list: list}) do
    list
  end

  def render("list_word_success.json", _) do
    %{ success: true }
  end

end
