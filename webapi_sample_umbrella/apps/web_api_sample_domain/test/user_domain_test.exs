defmodule UserDomainTest do
  use WebApiSampleBase.Case
  alias WebApiSampleDomain.User

  describe "user domain test" do
    test "update user domain" do
      target_user = %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"}
      update_user = %User{id: "1", user_name: "aaaaahenoheno", mail: "aaaaaahenoheno@mohe.zi"}

      assert User.update(target_user, update_user) == update_user
    end
  end

  test "update user domain juse user_name" do
    target_user = %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"}
    update_user = %User{id: "1", user_name: "aaaaahenoheno"}

    assert User.update(target_user, update_user) ==
             %User{id: "1", user_name: "aaaaahenoheno", mail: "henoheno@mohe.zi"}
  end

  test "update user domain juse mail" do
    target_user = %User{id: "1", user_name: "henoheno", mail: "henoheno@mohe.zi"}
    update_user = %User{id: "1",  mail: "aaaahenoheno@mohe.zi"}

    assert User.update(target_user, update_user) ==
             %User{id: "1", user_name: "henoheno", mail: "aaaahenoheno@mohe.zi"}
  end
end
