# == Schema Information
#
# Table name: meals
#
#  id         :integer          not null, primary key
#  time       :datetime
#  location   :integer
#  created_at :datetime
#  updated_at :datetime
#  meal_type  :integer
#

require 'open-uri'
require 'nokogiri'

class Meal < ActiveRecord::Base
	include HomeHelper
	# if updating enum, make sure to update locations_for_display below
	enum location: {selleck: 23, cpn: 24, hss:20, abel:22, east_cafe:101, east_deli:106}
	enum meal_type: [:breakfast, :lunch, :dinner]
	has_many :foods, inverse_of: :meal

def getFoodsForMeal(hall,type)
	doc = Nokogiri::HTML(open("http://menu.unl.edu/default.aspx?gComplex=#{hall}"))	
	foods = [] 
	queryString = "#cphMain_pnl#{type.capitalize}Items .MenuItem"
	doc.css(queryString).each do | item |
		unless item.content.blank?
			food = Food.new
			food.food_type = type
			food.name = clean_food_name(item.content)
			foods.push food
		end
	end
	self.foods = foods
	self.save
end

def self.locations_for_display
	{"Selleck" => 23, "CPN" => 24, "HSS" => 20, "Abel/Sandoz" => 22, "East Campus Cafe" => 101, "East Campus Deli" => 106}
end


end
