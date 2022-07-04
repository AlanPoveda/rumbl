defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context using Repo API

  """
  alias Rumbl.Repo
  alias Rumbl.Accounts.User

  def list_users() do
    Repo.all(User)
    # [
    #   %User{id: 1, name: "Alan Poveda", username: "alanpoveda"},
    #   %User{id: 2, name: "Natalia Silva", username: "nataliahieda"},
    #   %User{id: 3, name: "Gabriel Melo", username: "gabrielmelo"}
    # ]
  end

  def get_user(id) do
    Repo.get(User, id)
    # Enum.find(list_users(), &(&1.id == id))
  end

  @doc """
  Return a error if not found a user
  """
  def get_user!(id) do
    Repo.get(User, id)
  end

  def get_user_by(params) do
    Repo.get_by(User, params)
    # Enum.find(list_users(), &(Enum.all?(params, fn {key, val} -> Map.get(&1, key) == val end)))
  end
end
