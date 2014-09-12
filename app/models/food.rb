# == Schema Information
#
# Table name: foods
#
#  id         :integer          not null, primary key
#  food_type  :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#  meal_id    :integer
#

class Food < ActiveRecord::Base
	belongs_to :meal, inverse_of: :foods
end
