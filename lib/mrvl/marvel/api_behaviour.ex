defmodule Mrvl.Marvel.ApiBehaviour do
  @moduledoc false

  @callback get_characters(%{String.t() => term()}) :: {:ok, Tesla.Env.t()}
end
