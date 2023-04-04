defmodule Pokefight.Fights.Get do
  alias Pokefight.{Repo, Fight}

  def call(id) do
    Fight
    |> Repo.get(id)
    |> handle_get()
  end

  defp handle_get(%Pokefight.Fight{} = result), do: {:ok, result}
  defp handle_get(nil), do: {:error, "Fight not found!"}
end
