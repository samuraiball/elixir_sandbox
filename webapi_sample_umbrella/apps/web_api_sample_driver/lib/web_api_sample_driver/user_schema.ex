defmodule WebApiSampleDriver.UserSchema do
  use Ecto.Schema

  @primary_key false
  schema "user" do
    field :user_id, :string, primary_key: true
    field :user_name, :string
    field :mail, :string
  end
end
