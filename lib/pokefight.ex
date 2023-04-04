defmodule Pokefight do
  alias Pokefight.Fights.{Create, Get, All}
  alias Pokefight.Pokemon

  defdelegate create_fight(params), to: Create, as: :call
  defdelegate get_fight(id), to: Get, as: :call
  defdelegate get_all_fights(), to: All, as: :call

  defdelegate get_pokemon(name), to: Pokemon.Get, as: :call
end
