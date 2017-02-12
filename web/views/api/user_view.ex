defmodule WordlogElixer.Api.UserView do
  use WordlogElixer.Web, :view

  def render("show.json", %{user: user}) do
    %{data: render_one(user, WordlogElixer.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email}
  end
end
