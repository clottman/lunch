class HomeController < ApplicationController
include HomeHelper

  def index  	
  	m = Meal.new
  	m.getFoodsForMeal(Meal.locations['selleck'], 'Lunch')
  	@meal = m
  end
end
