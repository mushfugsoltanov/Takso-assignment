defmodule Takso.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string
    field :age, :integer
    
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :username, :password, :age])
    |> validate_required([:name, :username, :password, :age])
    |> validate_number(:age, greater_than: 0)
  end
end