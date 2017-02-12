defmodule WordlogElixer.ListController do
  use WordlogElixer.Web, :controller
  alias WordlogElixer.List

  def index(conn, _params) do
    lists = Repo.all(List)
    render conn, "index.html", lists: lists
  end

  def show(conn, %{"id" => list_id}) do
    list = Repo.get(List, list_id) |> Repo.preload(words: :translations)
    render conn, "show.html", list: list
  end

  def new(conn, _params) do
    changeset = List.changeset(%List{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"list" => list_params}) do
    changeset = List.changeset(%List{}, list_params)
    case Repo.insert(changeset) do
      {:ok, list} ->
        conn
        |> put_flash(:info, "#{list.name} created!")
        |> redirect(to: list_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
