# a recipe for the cookbook
class Recipe
  attr_accessor :name, :ingredients, :directions, :prep_time, :difficulty, :status

  def initialize(name, ingredients, directions, prep_time, difficulty)
    @name = name
    @ingredients = ingredients
    @directions = directions
    @prep_time = prep_time
    @difficulty = difficulty
    @status = "false"
  end
end
