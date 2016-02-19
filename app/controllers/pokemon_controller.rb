class PokemonController < ApplicationController
  require 'open-uri'

  #def index
    #pokemon = open('http://pokeapi.co/api/v2/pokemon/').read
    #@pokemon = JSON.parse pokemon
    #paginate json: @pokemon, per_page: 12
  #end

  def index
    pokemon = open('http://pokeapi.co/api/v2/pokemon/').read
    pokemon = JSON.parse pokemon
    @pokemon  = pokemon.paginate(page: params[:page], per_page: 12)
    respond_to do |format|
      format.html
      format.json { render json: @pokemon }
    end
  end


  def show
    @poke = open('http://pokeapi.co/api/v2/pokemon' + '/' + params[:id] +'/').read
  end

end
