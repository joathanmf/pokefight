defmodule Pokefight.Pokemon do
  @keys [:id, :name, :weight, :types]

  @enforce_keys @keys

  @derive Jason.Encoder

  defstruct @keys

  def build(%{"id" => id, "name" => name, "weight" => weight, "types" => types}) do
    %__MODULE__{
      id: id,
      name: name,
      weight: weight,
      types: parse_types(types)
    }
  end

  defp parse_types(types), do: Enum.map(types, fn elem -> elem["type"]["name"] end)
end
