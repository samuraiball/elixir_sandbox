defmodule UserUsecaseTest do
  use WebApiSampleBase.Case
  alias WebApiSampleDomain.User
  alias WebApiSampleUsecase.UserUsecase


  describe "user usecase test" do
    test "create user" do
      WebApiSampleBase.UserGatewayMock
      |> expect(:save, fn _ ->
        :ok
      end)

      assert UserUsecase.save(%User{}) == :ok
    end
  end
end
