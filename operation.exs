# １から１３のリストを作成
num = Enum.to_list(1..13)

# リスト内をランダムに並び替え
lan = Enum.shuffle(num)

# 指定した値がリスト内にあるか確認
check = Enum.member?(lan,8)

# リスト内で指定した値ぶんの要素でリストを作る
sep = Enum.chunk_every(lan,5)
{a,b} = Enum.split(lan,5)

# IO.inspect(hd(a))
# IO.inspect(check)
# IO.inspect(hd(sep))
# IO.inspect(a)


# string = "パトカー"
# string2 = "タクシー"
# item = String.split(string,"")
# item2 = String.split(string2,"")
# IO.inspect(item)
# IO.inspect(item2)


