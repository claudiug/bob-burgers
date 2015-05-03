# == Schema Information
#
# Table name: story_statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :story_status do
  name 'name'
  end

end
