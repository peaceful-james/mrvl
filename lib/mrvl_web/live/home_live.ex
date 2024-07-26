defmodule MrvlWeb.HomeLive do
  @moduledoc false
  use MrvlWeb, :live_view

  import MrvlWeb.CoreComponents

  alias Mrvl.Characters.Character
  alias Mrvl.Marvel

  @impl LiveView
  def mount(params, _session, socket) do
    modal_character_id = Map.get(params, "marvel_id")

    socket
    |> assign_characters()
    |> assign(:modal_character_id, modal_character_id)
    |> then(&{:ok, &1})
  end

  @impl LiveView
  def handle_params(unsigned_params, _url, socket) do
    modal_character_id = Map.get(unsigned_params, "marvel_id")

    socket
    |> assign(:modal_character_id, modal_character_id)
    |> then(&{:noreply, &1})
  end

  @impl LiveView
  def render(assigns) do
    ~H"""
    <div id="home-live" class="w-full px-32 grid gap-4 md:gap-6 grid-cols-2 md:grid-cols-4">
      <.character :for={character <- @characters} character={character} />
      <.modal
        :if={@modal_character_id}
        show={true}
        id={"character-modal-#{@modal_character_id}"}
        on_cancel={JS.patch(~p"/")}
      >
        This is a modal.
      </.modal>
    </div>
    """
  end

  attr :character, Character, required: true

  defp character(assigns) do
    ~H"""
    <div
      id={"character-#{@character.marvel_id}"}
      class="relative rounded-md h-32 w-32 cursor-pointer hover:border-2"
      phx-click={JS.patch(~p"/character/#{@character.marvel_id}")}
    >
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
