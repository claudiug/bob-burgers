# == Schema Information
#
# Table name: stories
#
#  id              :integer          not null, primary key
#  title           :string
#  description     :string
#  hours           :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  department_id   :integer
#  story_status_id :integer
#

class Story < ActiveRecord::Base
  belongs_to :department
  belongs_to :story_status
  validates :title, presence: true
  validates :title, length: {within: 3..100}
  validates :description, length: {maximum: 1000}, allow_nil: true
  validates :hours, numericality: {only_integer: true}, allow_nil: true
end
