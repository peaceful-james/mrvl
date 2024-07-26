defmodule Mrvl.ApiCallLogs.ApiCallLog do
  @moduledoc false

  use Ecto.Schema
  import Ecto.Changeset

  schema "api_call_logs" do
    field :status, :integer
    field :url, :string
    timestamps(updated_at: false)
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:status, :url])
  end
end
