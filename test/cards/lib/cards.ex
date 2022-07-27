defmodule Cards do
  def create_dak do
    nums =
      ["One","Two","Three","Fore","Five","Six","Seven","Eight","Nine","Ten","Juck","Queen","King"]
    marks =
      ["Spade","Clover","Dia","heart"]
      for mark <- marks, num <- nums, do: "#{num}_of_#{mark}"
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  #分ける
  def deal(deck,num) do
    deck = Enum.split(deck,num)
    deck = Taple.to_list(deck)
    [my_deck|_deck] = deck
  end

  #指定したカードがあるか
  def check?(deck,check_item)do
    Enum.any?(deck, fn x -> x == check_item end)
  end

  #get関数で取得
  def get(my_deck,"file_name")do
    File.write(my_deck,"file_name")
  end
end
