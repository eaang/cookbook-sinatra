# frozen_string_literal: true

# a recipe with details
class Recipe
  attr_accessor :name, :ingredients, :directions,
                :prep_time, :difficulty, :status

  def initialize(name, description)
    @name = name
    @description = description
    @status = 'false'
  end
end
