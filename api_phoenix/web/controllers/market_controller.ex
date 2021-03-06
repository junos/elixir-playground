require IEx
defmodule ApiPhoenix.MarketController do
  use ApiPhoenix.Web, :controller

  alias ApiPhoenix.Market

  def index(conn, %{"format" => "xml" = _params}) do
    markets = Repo.all(Market)
    conn
    |> put_resp_content_type("text/xml")
    |> render "index.xml", data: markets
  end

  def index(conn, %{"format" => "csv" = _params}) do
    markets = Repo.all(Market)
    conn
    |> put_resp_content_type("text/csv")
    |> render "index.csv", data: markets
  end

  def index(conn, _params) do
    markets = Repo.all(Market)
    render(conn, "index.json", data: markets)
  end

  def create(conn, %{"market" => market_params}) do
    changeset = Market.changeset(%Market{}, market_params)

    case Repo.insert(changeset) do
      {:ok, market} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", market_path(conn, :show, market))
        |> render("show.json", market: market)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ApiPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    market = Repo.get!(Market, id)
    render(conn, "show.json", market: market)
  end

  def update(conn, %{"id" => id, "market" => market_params}) do
    market = Repo.get!(Market, id)
    changeset = Market.changeset(market, market_params)

    case Repo.update(changeset) do
      {:ok, market} ->
        render(conn, "show.json", market: market)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(ApiPhoenix.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    market = Repo.get!(Market, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(market)

    send_resp(conn, :no_content, "")
  end
end
