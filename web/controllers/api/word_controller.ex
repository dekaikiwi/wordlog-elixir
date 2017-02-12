defmodule WordlogElixer.Api.WordController do
  use WordlogElixer.Web, :controller
  alias WordlogElixer.Repo
  alias WordlogElixer.Word

  plug :scrub_params, "word" when action in [:create, :update]
  plug WordlogElixer.Authentication when action in [:create, :update]

  def index(conn, _params) do
    words = Repo.all(Word) |> Repo.preload(:translations)
    render conn, words: words
  end

  def show(conn, %{"id" => id}) do
    word = Repo.get!(Word, id) |> Repo.preload(:translations)
    render(conn, "show.json", word: word)
  end

  def create(conn, %{"word" => word_params}) do
    changeset = Word.changeset(%Word{}, word_params)

    case Repo.insert(changeset) do
      {:ok, word} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", word_path(conn, :show, word))
        |> render("show.json", word: word |> Repo.preload(:translations))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(WordlogElixer.ChangesetView, "error.json", changeset: changeset)
    end
  end

end
