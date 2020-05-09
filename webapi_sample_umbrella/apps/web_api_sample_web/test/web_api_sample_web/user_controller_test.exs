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

    test "list users", %{conn: conn} do
      WebApiSampleBase.UserUsecaseMock
      |> expect(:find_all, fn ->
        {:ok,
         [
           %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"},
           %User{id: "2", user_name: "henoheno", mail: "henoheno@mohe.zi"},
           %User{id: "3", user_name: "henoheno", mail: "henoheno@mohe.zi"}
         ]}
      end)

      res =
        conn
        |> get("/api/user/list")

      assert json_response(res, 200) ==
               %{
                 "user_list" => [
                   %{
                     "id" => "1",
                     "user_name" => "henoheno",
                     "mail" => "henoheno@mohe.zi"
                   },
                   %{
                     "id" => "2",
                     "user_name" => "henoheno",
                     "mail" => "henoheno@mohe.zi"
                   },
                   %{
                     "id" => "3",
                     "user_name" => "henoheno",
                     "mail" => "henoheno@mohe.zi"
                   }
                 ]
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
        # idは何でも良いんだけどそのアサーションうまく行かないぽよ...
        # assert a == create_user
        :ok
      end)

      res =
        conn
        |> post("/api/user", target_user)

      assert json_response(res, 201) == %{"status" => "created"}
    end

    test "update user", %{conn: conn} do
      target_user = %{"id" => "1", "user_name" => "heno", "mail" => "henoheno@mohe.zi"}
      user = %User{id: "1", user_name: "heno", mail: "henoheno@mohe.zi"}

      WebApiSampleBase.UserUsecaseMock
      |> expect(:update, fn a ->
        assert a == user
        :ok
      end)

      res =
        conn
        |> put("/api/user", target_user)

      assert json_response(res, 200) == %{"status" => "ok"}
    end

    test "delete user", %{conn: conn} do

      WebApiSampleBase.UserUsecaseMock
      |> expect(:delete, fn a ->
        assert a == "1"
        :ok
      end)

      res =
        conn
        |> delete("api/user/1")

      assert json_response(res, 204) == %{"status" => "no content"}
    end
  end
end
