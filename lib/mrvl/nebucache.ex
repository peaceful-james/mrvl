defmodule Mrvl.Nebucache do
  @moduledoc """
  Thin wrapper around `Nebulex.Cache`.
  """

  defmacro __using__(opts) do
    quote do
      use Nebulex.Cache, unquote(opts)

      alias Nebulex.Adapters.Local.Generation

      def memory do
        {mem, _max} = Generation.memory_info(__MODULE__)
        mem
      end
    end
  end
end
