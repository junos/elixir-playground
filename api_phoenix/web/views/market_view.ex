defmodule ApiPhoenix.MarketView do
  use ApiPhoenix.Web, :view

  attributes [:id, :name, :phone]
  #has_many :products, link: "/markets/:id/products"

  def render("index.xml", %{data: markets}) do
    {:person, %{id: 12345}, "Josh"} |> XmlBuilder.generate
  end

  def render("index.json", %{data: markets}) do
    %{data: render_many(markets, ApiPhoenix.MarketView, "market.json")}
  end

  def render("show.json", %{market: market}) do
    %{data: render_one(market, ApiPhoenix.MarketView, "market.json")}
  end

  def render("market.json", %{market: market}) do
    %{id: market.id,
      name: market.name,
      phone: market.phone}
  end
end
