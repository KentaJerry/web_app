defmodule ChatWeb.RoomLive.Show do

  @impl true
  def mount(%{"id" => id}, session, socket) do
    ...
    ChatWeb.Endpoint.subscribe("room:#{id}")
    ...
  end

  @impl true
  def handle_event("save", %{"message" => message_params}, socket) do
    case Rooms.create_message(message_params) do
      {:ok, _message} ->
        room = Rooms.get_room_with_messages!(socket.assigns.room.id)
        # 以下書き換え
        ChatWeb.Endpoint.broadcast!(
          "room:#{room.id}",
          "broadcast_message",
          %{ messages: room.messages }
        )
      {:error, %Ecto.Changeset{} = changeset } ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
  # ここ追加
  def handle_info(%{event: "broadcast_message", payload: state}, socket) do
    {:noreply, assign(socket, state)}
  end

  defp page_title(:show), do: "Show Room"
end
