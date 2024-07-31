defmodule MrvlWeb.CharactersLive do
  @moduledoc false
  use MrvlWeb, :live_view

  import MrvlWeb.CoreComponents

  alias Mrvl.Characters.Character
  alias Mrvl.Marvel

  @impl LiveView
  def mount(_params, _session, socket) do
    socket
    |> assign(:offset, 0)
    |> assign(:characters, [])
    |> then(&{:ok, &1})
  end

  @limit 20

  @impl LiveView
  def handle_params(unsigned_params, _url, socket) do
    modal_character =
      if socket.assigns.live_action == :character do
        marvel_id_string = Map.get(unsigned_params, "marvel_id")

        case Integer.parse(marvel_id_string) do
          {modal_character_id, ""} -> Enum.find(socket.assigns.characters, &(&1.marvel_id == modal_character_id))
          _ -> nil
        end
      end

    page =
      if socket.assigns.live_action == :index do
        page_string = Map.get(unsigned_params, "page", "0")

        case Integer.parse(page_string) do
          {page, ""} -> page
          _ -> 0
        end
      else
        0
      end

    socket
    |> assign(:offset, page * @limit)
    |> assign(:modal_character, modal_character)
    |> assign_characters()
    |> then(&{:noreply, &1})
  end

  @impl LiveView
  def render(assigns) do
    ~H"""
    <div id="characters-live">
      <div
        id="characters-grid"
        class="w-full px-2 md:px-32 grid gap-4 md:gap-6 grid-cols-2 md:grid-cols-4 justify-center"
      >
        <.character_logo :for={character <- @characters} character={character} />
        <.modal
          :if={@modal_character}
          show={true}
          id={"character-modal-#{@modal_character.marvel_id}"}
          on_cancel={JS.patch(~p"/")}
        >
          <.character_details character={@modal_character} />
        </.modal>
      </div>
      <div class="w-full flex justify-center mt-8">
        <.async_result assign={@async_result}>
          <:loading>
            <p class="text-lg text-amber-500 animate-bounce my-6">
              Please wait. We are loading more characters. This might take a while...
            </p>
          </:loading>
          <:failed :let={_failure}>there was an error loading the characters</:failed>
          <.button phx-click="load-more">
            Load more
          </.button>
        </.async_result>
      </div>
    </div>
    """
  end

  attr :character, Character, required: true

  defp character_logo(assigns) do
    ~H"""
    <div class="flex justify-center w-full">
      <div
        id={"character-logo-#{@character.marvel_id}"}
        class="relative rounded-md h-32 w-32 cursor-pointer hover:border-2"
        phx-click={JS.patch(~p"/character/#{@character.marvel_id}")}
      >
        <img src={@character.thumbnail} class="object-cover h-32 w-32" />
        <div class="absolute -bottom-0 w-full bg-black/60 text-white text-center">
          <%= @character.name %>
        </div>
      </div>
    </div>
    """
  end

  attr :character, Character, required: true

  defp character_details(assigns) do
    ~H"""
    <div
      id={"character-details-#{@character.marvel_id}"}
      class="w-full text-white bg-black text-center"
    >
      <div class="w-full flex">
        <img src={@character.thumbnail} class="object-coverh-32 w-32 md:h-96 md:w-96" />
        <div class="text-center grow pt-8 px-2 space-y-4">
          <p class="text-lg">
            <%= @character.name %>
          </p>
          <p>
            <%= @character.description %>
          </p>
        </div>
      </div>
      <div class="grid grid-cols-2 mt-4">
        <div id="comics">
          <h3 class="uppercase">Comics (<%= @character.comics_count %>)</h3>
          <p :for={comic <- @character.comics}>
            <%= comic.name %>
          </p>
        </div>
        <div id="events">
          <h3 class="uppercase">Events (<%= @character.events_count %>)</h3>
          <p :for={event <- @character.events}>
            <%= event.name %>
          </p>
        </div>
      </div>
    </div>
    """
  end

  @impl LiveView
  def handle_event("load-more", _unsigned_params, socket) do
    socket
    |> assign_characters()
    |> then(&{:noreply, &1})
  end

  defp assign_characters(socket) do
    params = %{limit: @limit, offset: socket.assigns.offset}

    socket
    |> assign(:async_result, AsyncResult.loading())
    |> start_async(:list_characters, fn ->
      Marvel.list_characters(params)
    end)
  end

  @impl LiveView
  def handle_async(:list_characters, {:ok, new_characters}, socket) do
    socket
    |> assign(:async_result, AsyncResult.ok(new_characters))
    |> update(:characters, &(&1 ++ new_characters))
    |> update(:offset, &(&1 + @limit))
    |> then(&{:noreply, &1})
  end
end
