defmodule CounterWeb.CalculatorLive do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div>
    <h1>結果:<%= @calculator %></h1>
    <button phx-click="1" phx-value-n="1">1</button>
    <button phx-click="2">2</button>
    <button phx-click="3">3</button>
    <br>
    <button phx-click="4">4</button>
    <button phx-click="5">5</button>
    <button phx-click="6">6</button>
    <br>
    <button phx-click="7">7</button>
    <button phx-click="8">8</button>
    <button phx-click="9">9</button>
    <br>
    <button phx-click="+">+</button>
    <button phx-click="-">-</button>
    <button phx-click="*">*</button>
    <br>
    <button phx-click="/">/</button>
    <button phx-click="=">=</button>
    <button phx-click="AC">AC</button>
    </div>

    """
  end
  def mount(_params, _session, socket) do
    socket = assign(socket, :calculator, "#{}")
    calc = %{display: " ",
     val1: 0,
     val2: 0,
     calculation: nil, #sisokuenzan
     mode: :val1, #val1 or val2
     result: nil #計算結果
    }

    socket
    |> assign(:daiplay , " ")
    |> assign(:val1 , socket)
    |> assign(:daiplay , " ")

    {:ok, socket}
  end


  def handle_event("=", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc
    end)

    {:noreply, socket}
  end
  def handle_event("1", _params, socket) do
    # IO.inspect(params, label: "1 paramsです")
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "1"
    end)

    {:noreply, socket}
  end
  def handle_event("2", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "2"
    end)

    {:noreply, socket}
  end
  def handle_event("3", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "3"
    end)
    {:noreply, socket}
  end
  def handle_event("4", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "4"
    end)
    {:noreply, socket}
  end
  def handle_event("5", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "5"
    end)
    {:noreply, socket}
  end
  def handle_event("6", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "6"
    end)
    {:noreply, socket}
  end
  def handle_event("7", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "7"
    end)
    {:noreply, socket}
  end
  def handle_event("8", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "8"
    end)
    {:noreply, socket}
  end
  def handle_event("9", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
        calc <> "9"
    end)
    {:noreply, socket}
  end

  def handle_event("+", _params, socket) do
    socket =
      update(socket, :calculator, fn calc ->
      calc.val1
    end)
    {:noreply, socket}
  end

  # def handle_event("+", _params, socket) do
  #   socket =
  #     update(socket, :calculator, fn calc ->
  #       calc +
  # end)
  # def handle_event("-", _params, socket) do
  #   socket =
  #     update(socket, :calculator, fn calc ->
  #       calc -
  # end)
  # def handle_event("*", _params, socket) do
  #   socket =
  #     update(socket, :calculator, fn calc ->
  #       calc + 1
  # end)
  # def handle_event("/", _params, socket) do
  #   socket =
  #     update(socket, :calculator, fn calc ->
  #       calc + 1
  # end)
  # def handle_event("1", _params, socket) do
  #   socket =
  #     update(socket, :calculator, fn calc ->
  #       calc + 1
  # end)
end
