# web/views/session_view.ex
defmodule WordlogElixer.SessionView do
  use WordlogElixer.Web, :view

  def render("show.json", %{session: session}) do
    %{data: render_one(session, WordlogElixer.SessionView, "session.json")}
  end

  def render("session.json", %{session: session}) do
    %{token: session.token}
  end

  def render("error.json", _anything) do
    %{errors: "failed to authenticate"}
  end
end
