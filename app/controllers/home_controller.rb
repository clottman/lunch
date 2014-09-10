class HomeController < ApplicationController
  def index
  	@meals = Meal.all
  end
end
