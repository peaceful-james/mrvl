defmodule Mrvl.Marvel.Api do
  @moduledoc """
  Marvel API client

  Only accepts GET requests.

  2xx for success
  304 if data "digest" has not changed
  429 if request limit reached
  """

  use Tesla

  plug Tesla.Middleware.BaseUrl, "http://gateway.marvel.com/v1/"

  @spec get_characters() :: term()
  def get_characters do
    get("public/characters")
  end

  defp build_ts, do: :microsecond |> NaiveDateTime.utc_now() |> NaiveDateTime.to_iso8601()

  defp build_hash(to_hash) do
    to_hash |> :erlang.md5() |> Base.encode16(case: :lower)
  end

  def build_ts_and_hash_params do
    private_key = Application.get_env(:mrvl, :marvel_private_key)
    public_key = Application.get_env(:mrvl, :marvel_public_key)

    ts = build_ts()
    hash = build_hash(ts <> private_key <> public_key)

    %{"ts" => ts, "hash" => hash}
  end
end
