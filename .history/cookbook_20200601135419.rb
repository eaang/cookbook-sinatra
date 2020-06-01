# frozen_string_literal: true

require 'csv'
require_relative 'recipe.rb'

# This is the makeshift repo to hold the recipes
class Cookbook
  attr_accessor :recipes

  def initialize(csv_file_path = nil)
    # loads existing Recipe from the CSV
    @path = csv_file_path
    @recipes = []
    CSV.open(csv_file_path).each.to_a.each do |each|
      @recipes << Recipe.new(each[0], each[1], each[2])
    end
  end

  def all
    # returns all the recipes
    @recipes
  end

  def recipe(index)
    # return the content of just one recipe
    @recipes[index]
  end

  def add_recipe(recipe)
    # adds a new recipe to the cookbook
    CSV.open(@path, 'a') do |csv|
      csv << [recipe.name.to_s, recipe.describe.to_s, recipe.status.to_s]
    end
    @recipes << recipe
  end
end
