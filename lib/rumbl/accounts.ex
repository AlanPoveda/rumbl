defmodule Rumbl.Accounts do
  @moduledoc """
  The Accounts context

  """

  alias Rumbl.Accounts.User

  def list_users() do
    [
      %User{id: 1, name: "Alan", username: "alanpoveda"},
      %User{id: 2, name: "Natalia", username: "nataliahieda"},
      %User{id: 3, name: "Gabriel", username: "gabrielmelo"}
    ]
  end

  def get_user(id) do
    Enum.find(list_users(), &(&1.id == id))
  end

  def get_user_by(params) do
    Enum.find(list_users(), &(Enum.all?(params, fn {key, val} -> Map.get(&1, key) == val end)))
  end
end
