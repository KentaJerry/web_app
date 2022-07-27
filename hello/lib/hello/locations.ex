defmodule Hello.Locations do

  alias Hello.Locations.Location
  alias Hello.Repo

  def create(attrs) do
    Location.changeset(%Location{}, attrs)
    |> Repo.insert()
  end

  def get_locations()do
    Repo.all(Location)
  end
  def get_location(id) do
    Repo.get(Location, id)
  end

  def update_location(location, params) do
    Location.changeset(location, params)
    |> Repo.update()
  end

  def delete_location(location) do
    Repo.delete(location)
  end

end
