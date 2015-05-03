# == Schema Information
#
# Table name: stories
#
#  id          :integer          not null, primary key
#  title       :string
#  description :string
#  hours       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Story < ActiveRecord::Base
  validates :title, presence: true
  validates :description, length: {maximum: 1000}, allow_nil: true
  validates :hours, numericality: {only_integer: true}, allow_nil: true
end
