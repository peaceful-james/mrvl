defmodule Mrvl.Marvel.ApiCache do
  @moduledoc false
  use Mrvl.Nebucache,
    otp_app: :mrvl,
    adapter: Nebulex.Adapters.Local
end
