class HomeController < ApplicationController
include HomeHelper

  def index  	
  	current_meal = select_current_meal

  	# I want to do:
  	# where(meal_type: current_meal)
  	# but it doesn't work - always sends 0 as meal_type. 
  	# Would be nice to figure out why.
  	m = Meal.send(current_meal).where("created_at >= ?", Time.current.beginning_of_day).first
  	
  	if m.blank?
  		m = Meal.new 
  		m.meal_type = current_meal
  		m.getFoodsForMeal(Meal.locations['selleck'], current_meal)
  	end
  	@meal = m
  end
end
