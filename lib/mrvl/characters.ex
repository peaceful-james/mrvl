defmodule Mrvl.Characters do
  @moduledoc """
  Marvel Characters, parsed from their API
  """

  def from_api_response(%Tesla.Env{} = response) do
    %{
      "data" => %{
        "count" => _count,
        "limit" => _limit,
        "offset" => _offset,
        "results" => results
      }
    } = response.body

Enum.map(results, &from_api_character/1)
  end

  def from_api_character(%{
        "id" => marvel_id,
        "name" => name,
        "description" => description,
        "thumbnail" => %{"path" => thumbnail_path, "extension" => thumbnail_extension}
      }) do
    %Mrvl.Character{
      marvel_id: marvel_id,
      name: name,
      description: description,
      thumbnail: thumbnail_path <> "." <> thumbnail_extension
    }
  end
end
