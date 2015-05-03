# == Schema Information
#
# Table name: story_statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class StoryStatus < ActiveRecord::Base
  has_many :stories

  validates :name, presence: true
  validates :name, length: {within: 3..100}
end
