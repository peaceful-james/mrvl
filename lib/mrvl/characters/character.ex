defmodule Mrvl.Characters.Character do
  @moduledoc false
  use Ecto.Schema

  schema "characters" do
    field :marvel_id, :string
    field :name, :string
    field :description, :string
    field :thumbnail, :string
  end
end
