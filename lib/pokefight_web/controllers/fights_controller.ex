defmodule PokefightWeb.FightsController do
  use PokefightWeb, :controller

  alias Pokefight.Fight

  # action_fallback PokefightWeb.FallbackController

  def create(conn, %{"pokemon1" => pkm1, "pokemon2" => pkm2} = params) do
    with {:ok, pkm1} <- Pokefight.get_pokemon(pkm1),
         {:ok, pkm2} <- Pokefight.get_pokemon(pkm2),
         {:ok, %Fight{} = fight} <- Pokefight.create_fight(params) do
      conn
      |> put_status(201)
      |> render("create.json", fight: fight, pkm1: pkm1, pkm2: pkm2)
    else
      {:error, reason} ->
        conn
        |> put_status(400)
        |> render("error.json", reason: reason)
    end
  end

  def create(conn, _params) do
    conn
    |> put_status(400)
    |> render("error.json", reason: "Can't be empty!")
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Fight{} = fight} <- Pokefight.get_fight(id) do
      conn
      |> put_status(200)
      |> render("show.json", fight: fight)
    else
      {:error, reason} ->
        conn
        |> put_status(404)
        |> render("error.json", reason: reason)
    end
  end

  def show(conn, _params) do
    conn
    |> put_status(400)
    |> render("error.json", reason: "Can't be empty!")
  end

  def index(conn, _params) do
    with {:ok, fights} <- Pokefight.get_all_fights() do
      conn
      |> put_status(200)
      |> render("all.json", fights: fights)
    else
      {:error, reason} ->
        conn
        |> put_status(404)
        |> render("error.json", reason: reason)
    end
  end
end
