defmodule Mrvl.Marvel.Api do
  @moduledoc """
  Marvel API client

  Only accepts GET requests.

  2xx for success
  304 if data "digest" has not changed
  429 if request limit reached
  """
  @behaviour Mrvl.Marvel.ApiBehaviour

  # import Nebulex.Caching.Decorators
  use Nebulex.Caching
  use Tesla

  alias Mrvl.Marvel.ApiBehaviour

  plug Tesla.Middleware.BaseUrl, "http://gateway.marvel.com/v1/"
  plug Tesla.Middleware.JSON
  plug Mrvl.Marvel.ApiCallLogsMiddleware

  @doc """
  Fetches list of characters.

  Recognised params:

  - limit: number of results to return
  - offset: number of results to skip

  Other params can be found here:
  https://developer.marvel.com/docs#!/public/getCreatorCollection_get_0
  """
  @decorate cacheable(cache: Mrvl.Marvel.ApiCache, opts: [ttl: :timer.hours(24)])
  @impl ApiBehaviour
  @spec get_characters(%{String.t() => term()}) :: {:ok, Tesla.Env.t()}
  def get_characters(params \\ %{}) do
    "public/characters"
    |> path_with_auth(params)
    |> get()
  end

  def build_timestamp, do: :microsecond |> NaiveDateTime.utc_now() |> NaiveDateTime.to_iso8601()

  def build_hash(to_hash) do
    to_hash |> :erlang.md5() |> Base.encode16(case: :lower)
  end

  defp path_with_auth(base_path, params) do
    private_key = Application.get_env(:mrvl, :marvel_private_key)
    public_key = Application.get_env(:mrvl, :marvel_public_key)

    ts = build_timestamp()
    hash = build_hash(ts <> private_key <> public_key)

    encoded_query =
      %{"apikey" => public_key, "ts" => ts, "hash" => hash}
      |> Map.put("orderBy", "name")
      |> Map.merge(params)
      |> URI.encode_query()

    base_path |> URI.new!() |> URI.append_query(encoded_query) |> URI.to_string()
  end
end
