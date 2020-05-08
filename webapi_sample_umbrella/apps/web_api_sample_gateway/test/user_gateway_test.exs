defmodule UserGayteWayTest do
  use WebApiSampleBase.Case
  alias WebApiSampleDomain.User
  alias WebApiSampleGateway.UserGateway
  alias WebApiSampleDriver.UserSchema

  describe "user gateway test" do
    test "save" do
      target_user = %User{
        id: "1",
        user_name: "henoheno",
        mail: "henoheno@mohe.zi"
      }

      target_user_schema = %UserSchema{
        user_id: "1",
        user_name: "henoheno",
        mail: "henoheno@mohe.zi"
      }

      WebApiSampleBase.UserDriverMock
      |> expect(:save, fn a ->
        assert a == target_user_schema
        :ok
      end)

      assert UserGateway.save(target_user) == :ok
    end

    test "list users" do
      users_schema = [
        %UserSchema{
          user_id: "1",
          user_name: "henoheno",
          mail: "henoheno@mohe.zi"
        },
        %UserSchema{
          user_id: "2",
          user_name: "henoheno",
          mail: "henoheno@mohe.zi"
        },
        %UserSchema{
          user_id: "3",
          user_name: "henoheno",
          mail: "henoheno@mohe.zi"
        }
      ]

      users = [
        %User{
          id: "1",
          user_name: "henoheno",
          mail: "henoheno@mohe.zi"
        },
        %User{
          id: "2",
          user_name: "henoheno",
          mail: "henoheno@mohe.zi"
        },
        %User{
          id: "3",
          user_name: "henoheno",
          mail: "henoheno@mohe.zi"
        }
      ]

      WebApiSampleBase.UserDriverMock
      |> expect(:find_all, fn ->
        {:ok, users_schema}
      end)

      assert UserGateway.find_all() == {:ok, users}
    end
  end
end
