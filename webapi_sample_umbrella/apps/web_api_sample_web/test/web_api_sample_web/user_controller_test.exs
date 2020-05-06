defmodule UserControllerTest do
  use WebApiSampleWeb.ConnCase
  alias WebApiSampleDomain.{User}

  describe "user controller" do
    test "user controller get", %{conn: conn} do
      user = %User{
        id: "1",
        user_name: "henoheno",
        mail: "henoheno@mohe.zi"
      }

      UserUsecase.UserUsecaseMock
      |> expect(:find, fn a ->
        assert a == "1"
        {:ok, user}
      end)

      res =
        conn
        |> get("/api/user/1")

      assert json_response(res, 200) == %{
               "id" => "1",
               "user_name" => "henoheno",
               "mail" => "henoheno@mohe.zi"
             }
    end
  end
end
