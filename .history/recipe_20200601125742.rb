# frozen_string_literal: true

# a recipe with details
class Recipe
  attr_accessor :name, :description, :status

  def initialize(name, description)
    @name = name
    @description = description
    @status = 'false'
  end
end
