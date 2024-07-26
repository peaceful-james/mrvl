defmodule Mrvl.Characters do
  @moduledoc """
  Marvel Characters, parsed from their API
  """
  alias Mrvl.Characters.Character
  alias Mrvl.Characters.Comic
  alias Mrvl.Characters.Event

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
        "thumbnail" => %{"path" => thumbnail_path, "extension" => thumbnail_extension},
        "comics" => %{"available" => comics_count, "items" => comics},
        "events" => %{"available" => events_count, "items" => events}
      }) do
    %Character{
      marvel_id: marvel_id,
      name: name,
      description: description,
      thumbnail: thumbnail_path <> "." <> thumbnail_extension,
      comics_count: comics_count,
      comics: Enum.map(comics, &from_api_comic/1),
      events_count: events_count,
      events: Enum.map(events, &from_api_event/1)
    }
  end

  defp from_api_comic(%{"name" => name, "resourceURI" => resource_uri}) do
    %Comic{name: name, resource_uri: resource_uri}
  end

  defp from_api_event(%{"name" => name, "resourceURI" => resource_uri}) do
    %Event{name: name, resource_uri: resource_uri}
  end
end
