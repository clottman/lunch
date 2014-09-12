# == Schema Information
#
# Table name: meals
#
#  id         :integer          not null, primary key
#  time       :datetime
#  location   :integer
#  created_at :datetime
#  updated_at :datetime
#  type       :integer
#
require 'open-uri'
require 'nokogiri'

class Meal < ActiveRecord::Base
	enum location: {selleck: 23, cpn: 24, hss:20, abel:22, east_cafe:101, east_deli:106}
	enum type: [:breakfast, :lunch, :dinner]
	has_many :foods, inverse_of: :meal

def getFoodsForMeal(hall,type)
	doc = Nokogiri::HTML(open("http://menu.unl.edu/default.aspx?gComplex=#{hall}"))	
	foods = [] 
	queryString = "#cphMain_pnl#{type.capitalize}Items .MenuItem"
	doc.css(queryString).each do | item |
		food = Food.new
		food.food_type = type
		food.name = item.content
		foods.push food
	end
	self.foods = foods
	self.save
end

end
