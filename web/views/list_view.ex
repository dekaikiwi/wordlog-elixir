defmodule WordlogElixer.ListView do
  use WordlogElixer.Web, :view

  def render("index.json", %{lists: lists}) do
    lists
  end

  def render("show.json", %{list: list}) do
    list
  end

end
