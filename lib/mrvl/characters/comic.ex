defmodule Mrvl.Characters.Comic do
  @moduledoc false
  use Ecto.Schema

  embedded_schema do
    field :name, :string
    field :resource_uri, :string
  end
end
