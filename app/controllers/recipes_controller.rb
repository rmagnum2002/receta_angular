class RecipesController < ApplicationController
  def index
    @recipes = params[:keywords].present? ? Recipe.where('name ilike ?',"%#{params[:keywords]}%") : []
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
