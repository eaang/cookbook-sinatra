# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
require_relative 'recipe.rb'
require_relative 'cookbook.rb'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get '/' do
  @cookbook = Cookbook.new('recipes.csv')
  erb :index
end

get '/new_recipe' do
  erb :new_recipe
end

def cleanup(ingredients)
  ingredients.gsub('\r\n', ';').gsub('\r', ';').gsub('\n', ';')
end

post '/new_recipe' do
  ingredients = cleanup(params[:ingredients])
  recipe = Recipe.new(params[:name], ingredients, directions, prep_time, difficulty)
  @cookbook.add_recipe(recipe)
end
