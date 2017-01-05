defmodule ApiPhoenix.ProductView do
  use ApiPhoenix.Web, :view

  def render("index.json", %{products: products}) do
    %{data: render_many(products, ApiPhoenix.ProductView, "product.json")}
  end

  def render("show.json", %{product: product}) do
    %{data: render_one(product, ApiPhoenix.ProductView, "product.json")}
  end

  def render("product.json", %{product: product}) do
    %{id: product.id,
      name: product.name,
      barcode: product.barcode,
      image: product.image,
      price: product.price,
      market_id: product.market_id}
  end
end
