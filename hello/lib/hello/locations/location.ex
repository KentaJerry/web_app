defmodule Hello.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations"do
    field :lat, :float
    field :lang, :float
    field :location_name, :string

    timestamps()
  end

  @basic_field [:lat, :lang, :location_name]

  def changeset(location, attrs\\ %{})do
    location
    |> cast(attrs, @basic_field)
    |> validate_required(@basic_field)
  end
end
