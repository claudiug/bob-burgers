# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  team_id    :integer
#

class User < ActiveRecord::Base
  belongs_to :team
  has_many :user_departments
  has_many :departments, through: :user_departments
  validates :name, presence: true
  validates :email, presence: true
  validates :name, uniqueness: {case_sensitive: true}
  validates :email, uniqueness: {case_sensitive: true}
  validates :name, length:  {within: 3..100}
  #TODO add regex for email
end
