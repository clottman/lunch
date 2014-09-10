# == Schema Information
#
# Table name: foods
#
#  id         :integer          not null, primary key
#  type       :integer
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Food < ActiveRecord::Base
end
