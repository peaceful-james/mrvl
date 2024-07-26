defmodule Mrvl.MarvelTest do
  use Mrvl.DataCase
  alias Mrvl.Marvel

  import Mox

  describe "get_characters/1" do
    test "calls get_characters on the API" do
      expect(MarvelApiMock, :get_characters, fn params ->
        Mrvl.Marvel.MockedApi.get_characters(params)
      end)

      params = %{"limit" => 1, "offset" => 0}
      assert Marvel.get_characters(params) == Mrvl.Marvel.MockedApi.get_characters(params)
    end
  end
end
