defmodule Pokefight.Pokemon.Get do
  alias Pokefight.PokeApi.Client
  alias Pokefight.Pokemon

  def call(name) do
    name
    |> Client.get_pokemon()
    |> handle_response()
  end

  defp handle_response({:ok, body}), do: {:ok, Pokemon.build(body)}
  defp handle_response({:error, _} = error), do: error
end
