defmodule Mrvl.Marvel do
  @moduledoc """
  Marvel
  """
  alias Mrvl.Marvel.Api

  @doc """
  Get the raw API result of a list of characters.
  """
  def get_characters(params) do
    api_impl().get_characters(params)
  end

  defp api_impl() do
    Application.get_env(:mrvl, :marvel_api, Api)
  end
end
