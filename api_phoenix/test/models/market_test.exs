defmodule ApiPhoenix.MarketTest do
  use ApiPhoenix.ModelCase

  alias ApiPhoenix.Market

  @valid_attrs %{name: "some content", phone: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Market.changeset(%Market{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Market.changeset(%Market{}, @invalid_attrs)
    refute changeset.valid?
  end
end
