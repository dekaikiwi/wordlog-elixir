defmodule WordlogElixer.Api.SearchView do
  use WordlogElixer.Web, :view

  def render("response.json", %{search_response: search_response}) do
    search_response
  end
end
