defmodule UserUsecaseTest do
  use WebApiSampleBase.Case
  alias WebApiSampleDomain.{User, Users}
  alias WebApiSampleUsecase.UserUsecase
  alias WebApiSampleDriver.UserSchema

  describe "user usecase test" do
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
  end
end
