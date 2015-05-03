# == Schema Information
#
# Table name: teams
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Team < ActiveRecord::Base
  has_many :users
  has_many :departments
  validates :name, presence: true
  validates :name, length: {within: 3..100}
  validates :name, uniqueness: {case_sensitive: true}
end
