defmodule RumblWeb.SessionController do
  use RumblWeb, :controller

  def new(conn, _params) do
    render(conn, "new.html")
  end

  @doc """
  This function is a login, if the user if exist in database
  return the redirect to index page if the login is correct, and error to the new.html
  """
  def create(conn, %{"session" => %{"username" => username, "password" => password}}) do
    case Rumbl.Accounts.authenticate_by_username_and_pass(username, password) do
      {:ok, user} ->
        conn
        |> RumblWeb.Auth.login(user)
        |> put_flash(:info, "Welcome back")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  @doc"""
  The delete function logout the user session
  """
  def delete(conn, _params) do
    conn
    |> RumblWeb.Auth.logout()
    |> redirect(to: Routes.page_path(conn, :index))
  end

end
