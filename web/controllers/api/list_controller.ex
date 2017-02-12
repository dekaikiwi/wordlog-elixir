defmodule WordlogElixer.Api.ListController do
  use WordlogElixer.Web, :controller

  alias WordlogElixer.Repo
  alias WordlogElixer.Word
  alias WordlogElixer.List
  alias WordlogElixer.ListWord

  plug :scrub_params, "list" when action in [:create, :update]

  def index(conn, _params) do
    lists = Repo.all(List) |> Repo.preload(words: :translations)
    render conn, lists: lists
  end

  def show(conn, %{"id" => id}) do
    list = Repo.get!(List, id) |> Repo.preload(words: :translations)
    render(conn, "show.json", list: list)
  end

  def create(conn, %{"list" => list_params}) do
    changeset = List.changeset(%List{}, list_params)

    case Repo.insert(changeset) do
      {:ok, list} ->
        conn

        |> put_status(:created)
        |> put_resp_header("location", list_path(conn, :show, list))
        |> render("show.json", list: list |> Repo.preload(words: :translations))
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(WordlogElixer.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def add_word(conn, %{"word_id" => word_id, "list_id" => list_id}) do

    list_word_params = Map.merge(%{"word_id" => word_id} , %{"list_id" => list_id})
    changeset = ListWord.changeset(%ListWord{}, list_word_params)

    case Repo.insert(changeset) do
      {:ok, list} ->
        conn
        |> put_status(:created)
        |> render(WordlogElixer.Api.ListView, "list_word_success.json", _: "")
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(WordlogElixer.ErrorView, "error.json", changeset: changeset)
    end
  end

end
