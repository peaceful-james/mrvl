# In your test/test_helper.exs
# <- Add this
Mox.defmock(MarvelApiMock, for: Mrvl.Marvel.ApiBehaviour)
# <- Add this
Application.put_env(:mrvl, :marvel_api, MarvelApiMock)

ExUnit.start()
Ecto.Adapters.SQL.Sandbox.mode(Mrvl.Repo, :manual)
