defmodule CardsTest do
  use ExUnit.Case
  doctest Cards, except: [shuffle: 1]

  test "トランプが52枚全て生成されているか" do
    deck = Cards.cards_deck()

    assert Cards.cards_deck == deck
    assert length(Cards.cards_deck) == 52
  end

  test "Listの中に第2引数の値が入っているか" do
    deck = [1,2,3,4,5,6,7,8,9]

    assert Cards.contains?(deck,2) == true
  end

  test "シャッフルできているか" do
    deck = [1,2,3,4,5,6,7,8,9]

    assert Cards.shuffle(deck) != deck
  end

  test "第2引数で指定した要素数でListが分割できているか" do
    deck = [1,2,3,4,5,6,7,8,9]

    assert Cards.deal(deck,3) == {[1,2,3],[4,5,6,7,8,9]}
  end

  test "バイナリ形式でファイルに保存できているか" do
    deck = [1,2,3,4,5,6,7,8,9]

    assert Cards.save(deck,"test_deck") == :ok
  end

  test "バイナリ形式のファイルを読み込めて展開できているか" do

    assert Cards.load("test_deck") == [1,2,3,4,5,6,7,8,9]
  end

end
