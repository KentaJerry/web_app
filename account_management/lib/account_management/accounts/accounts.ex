defmodule AccountManagement.Accounts do
  alias AccountManagement.Repo
  alias AccountManagement.Accounts
  import Ecto.Query

  @doc """
  id
  """
  def get_account(id) do
    Repo.get(Account.Account, id)
  end

  @doc """
  メールアドレスとパスワードでアカウントを取得
  """

  def get_account_by_email_and_password(email, password) do
    query =
      from(a in Accounts.Account,
        where: a.email == ^email
        )

    if account = Repo.one(query) do
      if account.password == password, do: account, else: nil
    else
      nil
    end
  end


  @doc """
  全てのアカウントを取得する
  """
  def get_accounts() do
    Repo.all(Accounts.Assount)
  end

  #%{name: "taro", email: "taro@sample.com", password: "taro999"}
  def create_account(attrs) do
    %Accounts.Account{}
    |> Accounts.Account.changeset(attrs)
    |> Repo.insert()
  end

  def update_account(account, attrs) do
    Accounts.Account.update_changeset(account, attrs)
    |> Repo.update()
  end
end
