defmodule WordlogElixer.TranslationController do

  use WordlogElixer.Web, :controller
  alias WordlogElixer.Repo
  alias WordlogElixer.Translation

  plug :scrub_params, "translation" when action in [:create, :update]
  plug :action

  def index(conn, _params) do
    translations = Repo.all(Translation) |> Repo.preload(:word)
    render conn, translations: translations
  end

  def create(conn, %{"translation" => translation_params, "word_id" => word_id}) do
    translation_params = Map.merge(translation_params, %{"word_id" => word_id})
    #Logger.debug translation_params
    changeset = Translation.changeset(%Translation{}, translation_params)

    case Repo.insert(changeset) do
      {:ok, translation} ->
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
