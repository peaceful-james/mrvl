defmodule Mrvl.Characters.Character do
  @moduledoc false
  use Ecto.Schema

  alias Mrvl.Characters.Comic

  schema "characters" do
    field :marvel_id, :string
    field :name, :string
    field :description, :string
    field :thumbnail, :string
    embeds_many :comics, Comic
    field :comic_count, :integer
  end
end
