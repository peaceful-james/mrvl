defmodule Mrvl.Marvel.ApiTest do
  use Mrvl.DataCase
  alias Mrvl.Marvel.Api

  describe "build_timestamp/0" do
    test "returns a string" do
      result = Api.build_timestamp()
      assert is_binary(result)
      assert String.starts_with?(result, "20")
    end
  end

  describe "build_hash/1" do
    test "adheres to the Marvel docs" do
      # See https://developer.marvel.com/documentation/authorization
      result = Api.build_hash("1abcd1234")
      assert result == "ffd275c5130566a2916217b101f26150"
    end
  end
end
