defmodule MrvlWeb.HomeLive do
  use Phoenix.LiveView
  alias Phoenix.LiveView
  alias Mrvl.Marvel
  alias Mrvl.Characters.Character

  @impl LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign_characters()
    |> then(&{:ok, &1})
  end

  @impl LiveView
  def render(assigns) do
    ~H"""
    <div id="home-live" class="w-full px-32 grid gap-4 md:gap-6 grid-cols-2 md:grid-cols-4">
      <.character :for={character <- @characters} character={character} />
    </div>
    """
  end

  attr :character, Character, required: true

  defp character(assigns) do
    ~H"""
    <div id={"character-#{@character.marvel_id}"} class="relative rounded-md h-32 w-32">
      <img src={@character.thumbnail} class="object-cover h-32 w-32" />
      <div class="absolute -bottom-0 w-full bg-black/60 text-white text-center">
      <%= @character.name %>
      </div>
    </div>
    """
  end

  defp assign_characters(socket) do
    params = %{}
    characters = Marvel.list_characters(params)
    assign(socket, characters: characters)
  end
end
