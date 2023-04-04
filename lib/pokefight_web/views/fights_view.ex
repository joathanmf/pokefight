defmodule PokefightWeb.FightsView do
  use PokefightWeb, :view

  def render("show.json", %{fight: fight}) do
    %{
      fight: fight
    }
  end

  def render("create.json", %{fight: fight, pkm1: pkm1, pkm2: pkm2}) do
    %{
      fight: fight,
      pokemons: [pkm1, pkm2]
    }
  end

  def render("all.json", %{fights: fights}) do
    %{
      fights: fights
    }
  end

  def render("error.json", %{reason: reason}) do
    %{
      error: reason
    }
  end
end
