defmodule Mrvl.Characters.Character do
  use Ecto.Schema

  schema "characters" do
    field :marvel_id, :string
    field :name, :string
    field :description, :string
    field :thumbnail, :string
  end
end
