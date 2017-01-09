defmodule ApiPhoenix.PriceView do
  use ApiPhoenix.Web, :view

  attributes [:field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field11, :field12, :field13, :field14, :field15  ]

  def render("index.xml", %{data: prices}) do
    #IEx.pry
    # {:person, %{id: 12345}, "Josh"} |> XmlBuilder.generate
    m = {:prices, nil, Enum.map(prices, fn(x) -> {:price, nil,
                    [
                    {:field1, nil, x.field1},
                    {:field2, nil, x.field2},
                    {:field3, nil, x.field3},
                    {:field4, nil, x.field4},
                    {:field5, nil, x.field5},
                    {:field6, nil, x.field6},
                    {:field7, nil, x.field7},
                    {:field8, nil, x.field8},
                    {:field9, nil, x.field9},
                    {:field10, nil, x.field10},
                    {:field11, nil, x.field11},
                    {:field12, nil, x.field12},
                    {:field13, nil, x.field13},
                    {:field14, nil, x.field14},
                    {:field15, nil, x.field15}
                  ]}
                  end)}
    m |> XmlBuilder.generate
  end

  def render("index.csv", %{data: prices}) do
    Enum.join(Enum.map(prices, fn(x) -> "#{x.field1},#{x.field2},#{x.field3},#{x.field4},#{x.field5},#{x.field6},#{x.field7},#{x.field8},#{x.field9},#{x.field10},#{x.field11},#{x.field12},#{x.field13},#{x.field14},#{x.field15}" end), "\n")
  end

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
