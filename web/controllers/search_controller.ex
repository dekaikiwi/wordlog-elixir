defmodule WordlogElixer.SearchController do
  use WordlogElixer.Web, :controller

  def search_jisho(conn, %{"word" => word}) do
    word = URI.encode(word)
    response = HTTPotion.get "http://jisho.org/api/v1/search/words?keyword=#{word}"

    case {response.status_code} do
      {:ok} ->
        conn
        |> put_status(response.status_code)
        |> render("response.json", search_response: Poison.decode!(response.body))
      _ ->
        conn
        |> put_status(response.status_code)
        |> render("response.json", search_response: Poison.decode!(response.body))
    end
  end

end
