defmodule Pokefight.Fight do
  use Ecto.Schema
  import Ecto.Changeset

  @required_params [:pokemon1, :pokemon2, :winner]

  @derive {Jason.Encoder, only: [:id] ++ @required_params}

  schema "fights" do
    field :pokemon1, :string
    field :pokemon2, :string
    field :winner, :string

    timestamps()
  end

  def build(params) do
    params
    |> changeset()
    |> apply_action(:insert)
  end

  def changeset(params) do
    %__MODULE__{}
    |> cast(params, @required_params)
    |> validate_required(@required_params)
  end
end
