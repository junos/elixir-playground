defmodule ApiPhoenix.PriceController do
  use ApiPhoenix.Web, :controller

  alias ApiPhoenix.Price

  def index(conn, _params) do
    prices = Repo.all(Price)
    render(conn, "index.json", prices: prices)
  end

  def create(conn, %{"price" => price_params}) do
    changeset = Price.changeset(%Price{}, price_params)

    case Repo.insert(changeset) do
      {:ok, price} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", price_path(conn, :show, price))
        |> render("show.json", price: price)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ApiPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    price = Repo.get!(Price, id)
    render(conn, "show.json", price: price)
  end

  def update(conn, %{"id" => id, "price" => price_params}) do
    price = Repo.get!(Price, id)
    changeset = Price.changeset(price, price_params)

    case Repo.update(changeset) do
      {:ok, price} ->
        render(conn, "show.json", price: price)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ApiPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    price = Repo.get!(Price, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(price)

    send_resp(conn, :no_content, "")
  end
end
