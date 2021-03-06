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
  csv_file = File.join(__dir__, 'recipes.csv')
  @recipes = []
  CSV.open(csv_file).each.to_a.each do |each|
    @recipes << Recipe.new(each[0], each[1], each[2], each[3], each[4])
  end
  erb :index
end
