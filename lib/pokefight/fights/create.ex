defmodule Pokefight.Fights.Create do
  alias Pokefight.{Fight, Repo}

  def call(params) do
    params
    |> randomize_winner()
    |> Fight.build()
    |> create_fight()
    |> handle_insert()
  end

  defp create_fight({:ok, result}), do: Repo.insert(result)
  defp create_fight({:error, _} = error), do: error

  defp handle_insert({:ok, %Fight{}} = result), do: result
  defp handle_insert({:error, result}), do: {:error, %{result: result, status: 400}}

  defp randomize_winner(pokemons) do
    winner =
      pokemons
      |> Map.values()
      |> Enum.random()

    Map.put_new(pokemons, "winner", winner)
  end
end
