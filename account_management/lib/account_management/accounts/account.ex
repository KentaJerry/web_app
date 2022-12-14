defmodule AccountManagement.Accounts.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :name, :string
    field :email, :string
    field :password, :string

    timestamps()
  end

  @required_field [
    :name,
    :email,
    :password
  ]

    def changeset(account,attrs\\%{}) do
    account
    |> cast(attrs, @required_field)
    |> validate_required(@required_field)
    |> validate_email()
    |> validate_password()
  end

  def update_changeset(account, attrs) do
    account
    |> cast(attrs, @required_field)
    |> validate_required(@required_field)
  end

  defp validate_email(changeset) do
    changeset
    |> validate_required([:email])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "@記号が必要です。また、スペースは使用できません。")
    |> validate_length(:email, max: 160)
    |> unique_constraint(:email)
  end

  defp validate_password(changeset) do
    changeset
    |> validate_required([:password])
    |> validate_length(:password, min: 5, max: 72)
  end
end
