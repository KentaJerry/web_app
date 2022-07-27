defmodule Cards do
  @moduledoc """
   カード関数の操作方法をまとめたモジュールです
ken

  @doc """
  52種類のカードを生成する関数

  ## Example
  ```
  iex> Cards.cards_deck
  ["Ace_of_Spade","Ace_of_Clover","Ace_of_Diamond","Ace_of_Heart","Two_of_Spade","Two_of_Clover","Two_of_Diamond","Two_of_Heart","Three_of_Spade","Three_of_Clover","Three_of_Diamond","Three_of_Heart","Tour_of_Spade","Tour_of_Clover","Tour_of_Diamond","Tour_of_Heart","Five_of_Spade","Five_of_Clover","Five_of_Diamond","Five_of_Heart","Six_of_Spade","Six_of_Clover","Six_of_Diamond","Six_of_Heart","Seven_of_Spade","Seven_of_Clover","Seven_of_Diamond","Seven_of_Heart","Eight_of_Spade","Eight_of_Clover","Eight_of_Diamond","Eight_of_Heart","Nine_of_Spade","Nine_of_Clover","Nine_of_Diamond","Nine_of_Heart","Ten_of_Spade","Ten_of_Clover","Ten_of_Diamond","Ten_of_Heart","Jack_of_Spade","Jack_of_Clover","Jack_of_Diamond","Jack_of_Heart","Queen_of_Spade","Queen_of_Clover","Queen_of_Diamond","Queen_of_Heart","King_of_Spade","King_of_Clover","King_of_Diamond","King_of_Heart"]
  ```
  """
  def cards_deck do
    numbers =
      ["Ace","Two","Three","Tour","Five","Six","Seven","Eight","Nine",
      "Ten","Jack","Queen","King"]
      suits = ["Spade","Clover","Diamond","Heart"]

      for num <- numbers,suit <- suits do
        "#{num}_of_#{suit}"
      end
    end

    @doc """
    作ったデッキをシャッフルする関数

    ## Example
    ```
    iex> Cards.shuffle([1,2,3,4,5,6,7,8,9])
    [2,5,1,3,7,4,9,6,8]
    ```
    """
    def shuffle(deck) do
      Enum.shuffle(deck)
    end

    @doc """
    指定したカードがあるのか調べる関数

    ## Example
    ```
    iex> Cards.contains?([1,2,3,4,5,6,7,8,9],1)
    true
    ```
    """
    def contains?(deck,str) do
      Enum.member?(deck,str)
    end

    @doc """
    指定した枚数を配る関数

    ## Example
    ```
    iex> Cards.deal([1,2,3,4,5,6,7,8,9],3)
    {[1,2,3],[4,5,6,7,8,9]}
    ```
    """
    def deal(deck, deal_size) do
      Enum.split(deck, deal_size)
    end

    @doc """
    デッキを保存する関数

    ## Example
    ```
    iex> Cards.save([1,2,3,4,5,6,7,8,9],"deck")
    ```
    """
    def save(deck, file_name) do
      binary = :erlang.term_to_binary(deck)
      File.write(file_name, binary)
    end

    @doc """
    指定したファイルが存在するか調べる関数

    ## Example
    ```
    iex> Cards.load("a")
    "Something went wrong"

    iex> Cards.load("deck")
    [1,2,3,4,5,6,7,8,9]
    ```
    """
    def load(file_name) do
    {status, binary} = File.read(file_name)

    case status do
      :error -> "Something went wrong"
      :ok -> :erlang.binary_to_term(binary)
    end
  end
end
