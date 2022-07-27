defmodule HelloWeb.MapController do
  use HelloWeb, :controller
  alias Hello.Locations.Location
  alias Hello.Locations


  def index(conn, _parms)do
    locations = Locations.get_locations()
    render(conn, "index.html", locations: locations)
  end

  def new(conn, _params) do
    IO.inspect(conn)
    changeset = Location.changeset(%Location{})
    render(conn, "new.html",changeset: changeset)
  end

  def create(conn, params) do
    case Locations.create(params["location"]) do
      {:ok, _location} ->
        conn
        |> put_flash(:info,  "座標ができました。")
        |> redirect(to: Routes.map_path(conn, :index))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "new.html", changeset: changeset)
    end
  end
  def show(conn, %{"id" => id}) do
    location = Locations.get_location(id)
    render(conn,"show.html", location: location)
  end

  def edit(conn, %{"id" => id}) do
    location = Locations.get_location(id)
    changeset = Location.changeset(location)
    render(conn, "edit.html", location: location, changeset: changeset)
  end

  def update(conn, %{"id" => id, "location" => location_params}) do
    location = Locations.get_location(id)

    case Locations.update_location(location, location_params) do
      {:ok, _location} ->
        conn
        |> put_flash(:info, "編集しました。")
        |> redirect(to: Routes.map_path(conn, :index))

        {:error, %Ecto.Changeset{} = changeset} ->
          render(conn, "edit.html", location: location, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    location = Locations.get_location(id)
    {:ok, _location} = Locations.delete_location(location)

    conn
    |> put_flash(:info, "削除しました。")
    |> redirect(to: Routes.map_path(conn, :index))
  end
end
