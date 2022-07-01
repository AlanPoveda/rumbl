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
end
