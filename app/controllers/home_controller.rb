class HomeController < ApplicationController
include HomeHelper

  def index(location = nil)
    @meal = get_meal
  end

  def change_location
    @meal = get_meal(params[:location])
    render partial: 'redraw_meal'
  end
end
