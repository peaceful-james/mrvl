defmodule Mrvl.Repo.Migrations.CreateApiCallLogs do
  use Ecto.Migration

  def change do
    create table(:api_call_logs) do
      add :status, :integer, null: true
      add :url, :string, null: true
      timestamps(updated_at: false)
    end
  end
end
