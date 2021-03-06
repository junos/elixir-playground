require IEx
defmodule ApiPhoenix.PriceController do
  use ApiPhoenix.Web, :controller

  alias ApiPhoenix.Price

  # def index(conn, _params) do
  #   prices = query1()
  #   render(conn, "index.json", prices: prices)
  # end

  def index(conn, %{"format" => "xml" = _params}) do
    prices = query1()
    conn
    |> put_resp_content_type("text/xml")
    |> render "index.xml", data: prices
  end

  def index(conn, %{"format" => "csv" = _params}) do
    prices = query1()
    conn
    |> put_resp_content_type("text/csv")
    |> render "index.csv", data: prices
  end

  def index(conn, _params) do
    prices = query1()
    render(conn, "index.json", data: prices)
  end

  def query1() do
    Repo.all(
      from p in Price,
      limit: 1)
  end

  def query2() do
    Repo.all(
      from p in Price,
      where: p.field2 == "AAPL",
      limit: 6707)
  end

  def query3() do
    Repo.all(
      from p in Price,
      where: p.field2 == "AAPL")
  end

  # def create(conn, %{"price" => price_params}) do
  #   changeset = Price.changeset(%Price{}, price_params)
  #
  #   case Repo.insert(changeset) do
  #     {:ok, price} ->
  #       conn
  #       |> put_status(:created)
  #       |> put_resp_header("location", price_path(conn, :show, price))
  #       |> render("show.json", price: price)
  #     {:error, changeset} ->
  #       conn
  #       |> put_status(:unprocessable_entity)
  #       |> render(ApiPhoenix.ChangesetView, "error.json", changeset: changeset)
  #   end
  # end

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
