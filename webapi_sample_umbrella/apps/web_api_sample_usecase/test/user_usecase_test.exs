defmodule UserUsecaseTest do
  use WebApiSampleBase.Case
  alias WebApiSampleDomain.{User, Users}
  alias WebApiSampleUsecase.UserUsecase
  alias WebApiSampleDriver.UserSchema

  describe "user usecase test" do
    test "find user by id " do
      WebApiSampleBase.UserGatewayMock
      |> expect(:find_by, fn a ->
        assert a == "1"
        %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"}
      end)

      assert UserUsecase.find("1") ==
               %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"}
    end

    test "create user" do
      WebApiSampleBase.UserGatewayMock
      |> expect(:save, fn _ ->
        :ok
      end)

      assert UserUsecase.save(%User{}) == :ok
    end

    test "list users" do
      WebApiSampleBase.UserGatewayMock
      |> expect(:find_all, fn ->
        [
          %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"},
          %User{id: "2", user_name: "henoheno", mail: "henoheno@mohe.zi"},
          %User{id: "3", user_name: "henoheno", mail: "henoheno@mohe.zi"}
        ]
      end)

      assert UserUsecase.find_all() == [
               %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"},
               %User{id: "2", user_name: "henoheno", mail: "henoheno@mohe.zi"},
               %User{id: "3", user_name: "henoheno", mail: "henoheno@mohe.zi"}
             ]
    end

    test "update exist user" do
      user = %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"}

      updated_user = %User{id: "1", user_name: "updated_henoheno", mail: "henoheno@mohe.zi"}

      WebApiSampleBase.UserGatewayMock
      |> expect(:find_by, fn a ->
        assert a == "1"
        {:ok, user}
      end)
      |> expect(:save, fn a ->
        assert a == updated_user
        :ok
      end)

      assert UserUsecase.update(updated_user) == :ok
    end

    test "delete user" do

      WebApiSampleBase.UserGatewayMock
      |> expect(:delete, fn a ->
        assert a == "1"
        :ok
       end)

      assert UserUsecase.delete("1") == :ok
    end
  end
end
