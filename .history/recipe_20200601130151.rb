# frozen_string_literal: true

# a recipe with details
class Recipe
  attr_accessor :name, :describe, :status

  def initialize(name, description)
    @name = name
    @describe = describe
    @status = 'false'
  end
end
