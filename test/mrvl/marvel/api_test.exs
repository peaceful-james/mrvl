defmodule Mrvl.Marvel.ApiTest do
  use Mrvl.DataCase
  alias Mrvl.Marvel.Api

  describe "build_ts_and_hash_params/0" do
    test "works" do
      result = Api.build_ts_and_hash_params()
      assert %{"ts" => ts, "hash" => hash} = result

      assert hash ==
               (ts <>
                  Application.get_env(:mrvl, :marvel_private_key) <>
                  Application.get_env(:mrvl, :marvel_public_key))
               |> :erlang.md5()
               |> Base.encode16(case: :lower)
    end
  end
end
