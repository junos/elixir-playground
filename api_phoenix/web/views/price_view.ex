defmodule ApiPhoenix.PriceView do
  use ApiPhoenix.Web, :view

  def render("index.json", %{prices: prices}) do
    %{data: render_many(prices, ApiPhoenix.PriceView, "price.json")}
  end

  def render("show.json", %{price: price}) do
    %{data: render_one(price, ApiPhoenix.PriceView, "price.json")}
  end

  def render("price.json", %{price: price}) do
    %{id: price.id,
      field1: price.field1,
      field2: price.field2,
      field3: price.field3,
      field4: price.field4,
      field5: price.field5,
      field6: price.field6,
      field7: price.field7,
      field8: price.field8,
      field9: price.field9,
      field10: price.field10,
      field11: price.field11,
      field12: price.field12,
      field13: price.field13,
      field14: price.field14,
      field15: price.field15}
  end
end
