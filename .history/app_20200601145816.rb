# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'
require_relative 'recipe.rb'
require_relative 'cookbook.rb'
use Rack::MethodOverride

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

post '/new_recipe' do
  @cookbook = Cookbook.new('recipes.csv')
  recipe = Recipe.new(params[:name].to_s,
                      params[:description].to_s,
                      params[:status].to_s)
  @cookbook.add_recipe(recipe)
  redirect to('/')
end

delete '/delete/:id' do
  id
end
