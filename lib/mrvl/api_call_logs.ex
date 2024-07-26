defmodule Mrvl.ApiCallLogs do
  @moduledoc """
  Used to know how often we are making requests to the Marvel API.

  We capture the timestamp of each successful API call into a database table.
  We also capture the URL and HTTP status.
  """
  alias Mrvl.ApiCallLogs.ApiCallLog
  alias Mrvl.Repo

  def create(attrs) do
    %ApiCallLog{}
    |> ApiCallLog.changeset(attrs)
    |> Repo.insert()
  end

  def list do
    Repo.all(ApiCallLog)
  end
end
