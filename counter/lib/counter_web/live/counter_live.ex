defmodule CounterWeb.CounterLive do
  use Phoenix.LiveView

  def render(assigns) do
    CounterWeb.CounterView.render("index.html", assigns)
  end

  def mount(_params, _session, socket) do
    socket = assign(socket, :count, 0)
    {:ok, socket}
  end

  def handle_event("inc", _params, socket) do
  socket =
    update(socket, :count, fn count ->
      count + 1
    end)

    {:noreply, socket}
  end

  def handle_event("dec", _params, socket) do
  socket =
    update(socket, :count, fn count ->
      count - 1
    end)

    {:noreply, socket}
  end

  def handle_event("res", _params, socket) do
  socket =
    update(socket, :count, fn _count ->
      0
    end)

    {:noreply, socket}
  end

end
