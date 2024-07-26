defmodule Mrvl.Marvel.ApiCallLogsMiddleware do
  @moduledoc false
  @behaviour Tesla.Middleware

  alias Mrvl.ApiCallLogs

  def call(env, next, _) do
    env
    |> Tesla.run(next)
    |> tap(&capture_call/1)
  end

  @spec capture_call(Tesla.Env.result()) :: any()
  defp capture_call(response) do
    case response do
      {:ok, %Tesla.Env{status: status, url: url}} ->
        ApiCallLogs.create(%{status: status, url: url})

      {:error, _} ->
        :noop
    end
  end
end
