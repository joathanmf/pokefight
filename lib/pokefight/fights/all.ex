defmodule Pokefight.Fights.All do
  alias Pokefight.{Repo, Fight}

  def call do
    Fight
    |> Repo.all()
    |> handle_get_all()
  end

  defp handle_get_all(nil), do: {:error, "Empty database!"}
  defp handle_get_all(result), do: {:ok, result}
end
