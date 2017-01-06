defmodule ApiPhoenix.PriceControllerTest do
  use ApiPhoenix.ConnCase

  alias ApiPhoenix.Price
  @valid_attrs %{field1: "some content", field10: "some content", field11: "some content", field12: "some content", field13: "some content", field14: "some content", field15: "some content", field2: "some content", field3: "some content", field4: "some content", field5: "some content", field6: "some content", field7: "some content", field8: "some content", field9: "some content"}
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, price_path(conn, :index)
    assert json_response(conn, 200)["data"] == []
  end

  test "shows chosen resource", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = get conn, price_path(conn, :show, price)
    assert json_response(conn, 200)["data"] == %{"id" => price.id,
      "field1" => price.field1,
      "field2" => price.field2,
      "field3" => price.field3,
      "field4" => price.field4,
      "field5" => price.field5,
      "field6" => price.field6,
      "field7" => price.field7,
      "field8" => price.field8,
      "field9" => price.field9,
      "field10" => price.field10,
      "field11" => price.field11,
      "field12" => price.field12,
      "field13" => price.field13,
      "field14" => price.field14,
      "field15" => price.field15}
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, price_path(conn, :show, -1)
    end
  end

  test "creates and renders resource when data is valid", %{conn: conn} do
    conn = post conn, price_path(conn, :create), price: @valid_attrs
    assert json_response(conn, 201)["data"]["id"]
    assert Repo.get_by(Price, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, price_path(conn, :create), price: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "updates and renders chosen resource when data is valid", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = put conn, price_path(conn, :update, price), price: @valid_attrs
    assert json_response(conn, 200)["data"]["id"]
    assert Repo.get_by(Price, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = put conn, price_path(conn, :update, price), price: @invalid_attrs
    assert json_response(conn, 422)["errors"] != %{}
  end

  test "deletes chosen resource", %{conn: conn} do
    price = Repo.insert! %Price{}
    conn = delete conn, price_path(conn, :delete, price)
    assert response(conn, 204)
    refute Repo.get(Price, price.id)
  end
end
