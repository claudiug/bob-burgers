# == Schema Information
#
# Table name: departments
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  team_id     :integer
#

class Department < ActiveRecord::Base
  belongs_to :team
  has_many :stories
  has_many :user_departments
  has_many :users, through: :user_departments
  validates :name, presence: true
  validates :name, length:  {within: 3..100}
  validates :description, length: {maximum: 1000} #, allow_nil: true
end
