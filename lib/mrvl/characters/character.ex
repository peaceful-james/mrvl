defmodule Mrvl.Characters.Character do
  @moduledoc false
  use Ecto.Schema

  alias Mrvl.Characters.Comic
  alias Mrvl.Characters.Event

  schema "characters" do
    field :marvel_id, :string
    field :name, :string
    field :description, :string
    field :thumbnail, :string
    embeds_many :comics, Comic
    field :comics_count, :integer
    embeds_many :events, Event
    field :events_count, :integer
  end
end
