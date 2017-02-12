defmodule WordlogElixer.Api.WordView do
  use WordlogElixer.Web, :view

  def render("index.json", %{words: words}) do
    words
  end

  def render("show.json", %{word: word}) do
    word
  end

end
