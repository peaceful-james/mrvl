defmodule Mrvl.ApiCallLogs.ApiCallLog do
  @moduledoc false

  schema "api_call_log" do
    add :status, :integer, null: true
    add :url, :string, null: true
    timestamps(updated_at: false)
  end

  def changeset(struct, attrs) do
    struct
    |> cast(attrs, [:status, :url])
  end
end
