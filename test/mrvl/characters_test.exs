defmodule Mrvl.CharactersTest do
  use Mrvl.DataCase

  alias Mrvl.Characters
  alias Mrvl.Characters.Character

  describe "from_api_response/1" do
    test "works" do
      params = %{"limit" => 1, "offset" => 0}
      {:ok, api_response} = Mrvl.Marvel.MockedApi.get_characters(params)
      result = Characters.from_api_response(api_response)
      assert [%Character{} = character] = result
      assert character.name == "3-D Man"
      assert character.description == ""
      assert String.ends_with?(character.thumbnail, ".jpg")
      assert is_list(character.comics)
      assert Enum.count(character.comics) == 12
      assert character.comics_count == 12
    end
  end
end
