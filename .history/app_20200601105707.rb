# frozen_string_literal: true

require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry-byebug'
require 'better_errors'

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path(__dir__)
end

get '/' do
  @csv_data = CSV.read('recipes.csv')
  @recipes = 
  erb :index
end
