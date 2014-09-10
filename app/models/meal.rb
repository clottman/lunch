# == Schema Information
#
# Table name: meals
#
#  id         :integer          not null, primary key
#  time       :datetime
#  location   :integer
#  created_at :datetime
#  updated_at :datetime
#

class Meal < ActiveRecord::Base
	enum location: {selleck: 23, cpn: 24, hss:20, abel:22, east_cafe:101, east_deli:106}
end
