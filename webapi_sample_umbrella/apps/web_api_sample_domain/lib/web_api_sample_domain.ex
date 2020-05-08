defmodule WebApiSampleDomain.User do
  @type t :: %__MODULE__{}
  defstruct [:id, :user_name, :mail]
end

defmodule WebApiSampleDomain.Users do
  alias WebApiSampleDomain.User
  @type t :: [User.t()]
end
