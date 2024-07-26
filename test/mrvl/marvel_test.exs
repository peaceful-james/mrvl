defmodule Mrvl.MarvelTest do
  use Mrvl.DataCase

  import Mox

  alias Mrvl.Marvel
  alias Mrvl.Marvel.MockedApi

  describe "get_characters/1" do
    test "calls get_characters on the API" do
      expect(MarvelApiMock, :get_characters, fn params ->
        MockedApi.get_characters(params)
      end)

      params = %{"limit" => 1, "offset" => 0}
      assert Marvel.get_characters(params) == MockedApi.get_characters(params)
    end
  end
end
