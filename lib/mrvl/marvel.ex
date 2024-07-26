defmodule Mrvl.Marvel do
  @moduledoc """
  Marvel
  """
  alias Mrvl.Characters
  alias Mrvl.Marvel.Api

  @doc """
  Get the raw API result of a list of characters.
  """
  def get_characters(params) do
    api_impl().get_characters(params)
  end

  def list_characters(params) do
    {:ok, response} = get_characters(params)
    Characters.from_api_response(response)
  end

  defp api_impl do
    Application.get_env(:mrvl, :marvel_api, Api)
  end
end
