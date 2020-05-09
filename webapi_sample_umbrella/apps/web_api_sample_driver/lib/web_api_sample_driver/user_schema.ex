defmodule WebApiSampleDriver.UserSchema do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "user" do
    field :user_id, :string, primary_key: true
    field :user_name, :string
    field :mail, :string
  end

  def changeset(user, params \\%{}) do
    user
    |>cast(params, [:user_name, :mail])
  end

end
