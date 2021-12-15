class FoodCombinationsController < ApplicationController
  include Pagy::Backend

  before_action :set_food_combination, only: %i[index overdose]

  def index; end

  def select; end

  def overdose; end

  private

  def set_food_combination
    @component_params = params[:component]
    genre_params = params[:genre]
    component_ids = Tag.where(id: @component_params)
    genre_ids = Tag.where(id: genre_params)

    if @component_params == ['1'] && genre_params == ['4']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    elsif @component_params == ['1'] && genre_params == ['5']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @rice = Tag.find_by(id: genre_ids, genre: 'rice')
    elsif @component_params == ['2'] && genre_params == ['4']
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    elsif @component_params == ['2'] && genre_params == ['5']
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @rice = Tag.find_by(id: genre_ids, genre: 'rice')
    elsif @component_params == ['3'] && genre_params == ['4']
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    elsif @component_params == ['3'] && genre_params == ['5']
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @rice = Tag.find_by(id: genre_ids, genre: 'rice')
    elsif @component_params == ['1', '2'] && genre_params == ['4']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    elsif @component_params == ['1', '2'] && genre_params == ['5']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @rice = Tag.find_by(id: genre_ids, genre: 'rice')
    elsif @component_params == ['1', '3'] && genre_params == ['4']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    elsif @component_params == ['1', '3'] && genre_params == ['5']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @rice = Tag.find_by(id: genre_ids, genre: 'rice')
    elsif @component_params == ['2', '3'] && genre_params == ['4']
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    elsif @component_params == ['2', '3'] && genre_params == ['5']
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @rice = Tag.find_by(id: genre_ids, genre: 'rice')
    elsif @component_params == ['1', '2', '3'] && genre_params == ['4']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @noodle = Tag.find_by(id: genre_ids, genre: 'noodle')
    elsif @component_params == ['1', '2', '3'] && genre_params == ['5']
      @sugar = Tag.find_by(id: component_ids, component: 'sugar')
      @lipid = Tag.find_by(id: component_ids, component: 'lipid')
      @salt = Tag.find_by(id: component_ids, component: 'salt')
      @rice = Tag.find_by(id: genre_ids, genre: 'rice')
    end

    @pagy, @foods = pagy(FoodCombination.preload(:main, :sub).preload_food_image, items: 25)
  end
end
