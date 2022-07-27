defmodule Math do
  def pat(taple) do
    {x,y} = taple
    x + y
  end
  
  def add(x,y\\0) do
    x + y
  end
end

# IO.push(Math.add(3,4))
