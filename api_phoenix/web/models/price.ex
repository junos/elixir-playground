defmodule ApiPhoenix.Price do
  use ApiPhoenix.Web, :model

  schema "prices" do
    field :field1, :string
    field :field2, :string
    field :field3, :string
    field :field4, :string
    field :field5, :string
    field :field6, :string
    field :field7, :string
    field :field8, :string
    field :field9, :string
    field :field10, :string
    field :field11, :string
    field :field12, :string
    field :field13, :string
    field :field14, :string
    field :field15, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field14, :field15])
    |> validate_required([:field1, :field2, :field3, :field4, :field5, :field6, :field7, :field8, :field9, :field10, :field11, :field12, :field13, :field14, :field15])
  end
end
