defmodule ApiPhoenix.PriceTest do
  use ApiPhoenix.ModelCase

  alias ApiPhoenix.Price

  @valid_attrs %{field1: "some content", field10: "some content", field11: "some content", field12: "some content", field13: "some content", field14: "some content", field15: "some content", field2: "some content", field3: "some content", field4: "some content", field5: "some content", field6: "some content", field7: "some content", field8: "some content", field9: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Price.changeset(%Price{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Price.changeset(%Price{}, @invalid_attrs)
    refute changeset.valid?
  end
end
