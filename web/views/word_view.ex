defmodule WordlogElixer.WordView do
  use WordlogElixer.Web, :view

  def render("index.json", %{words: words}) do
    words
  end
end
