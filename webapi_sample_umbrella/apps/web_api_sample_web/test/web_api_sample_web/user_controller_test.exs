defmodule UserControllerTest do
  use WebApiSampleWeb.ConnCase

  describe "" do
    test "system health cheack test", %{conn: conn} do

      res =
        conn
        |> get("/api/user/1")

      assert json_response(res, 201) == %{"status" => "ok"}
    end
  end
end
