defmodule WordlogElixer.TranslationView do
  use WordlogElixer.Web, :view

  def render("index.json", %{translations: translations}) do
    translations
  end
end
