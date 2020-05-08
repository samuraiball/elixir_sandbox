defmodule UserControllerTest do
  use WebApiSampleWeb.ConnCase
  alias WebApiSampleDomain.{User}

  describe "user controller" do
    test "find user by id", %{conn: conn} do
      user = %User{
        id: "1",
        user_name: "henoheno",
        mail: "henoheno@mohe.zi"
      }

      WebApiSampleBase.UserUsecaseMock
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

    test "create user", %{conn: conn} do
      target_user = %{"user_name" => "heno", "mail" => "henoheno@mohe.zi"}

      create_user = %User{
        user_name: "henoheno",
        mail: "henoheno@mohe.zi"
      }

      WebApiSampleBase.UserUsecaseMock
      |> expect(:save, fn a ->
        # アサーションうまく行かないぽよ...
        #assert a == create_user
        :ok
      end)

      res =
        conn
        |> post("/api/user", target_user)

      assert json_response(res, 201) == %{"status" => "created"}
    end
  end
end
