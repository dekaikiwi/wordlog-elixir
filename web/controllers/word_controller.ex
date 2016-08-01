defmodule WordlogElixer.WordController do
  use WordlogElixer.Web, :controller
  alias WordlogElixer.Repo
  alias WordlogElixer.Word

  plug :scrub_params, "word" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    words = Repo.all(Word) |> Repo.preload(:translations)
    render conn, words: words
  end

  def create(conn, %{"word" => word_params}) do
    changeset = Word.changeset(%Word{}, word_params)

    case Repo.insert(changeset) do
      {:ok, word} ->
        conn
        |> put_status(:created)
#        |> put_resp_header("location", todo_path(conn, :show, todo))
#        |> render("show.json", todo: todo)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(WordlogElixer.ChangesetView, "error.json", changeset: changeset)
    end
  end

end
