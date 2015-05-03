# == Schema Information
#
# Table name: story_statuses
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe StoryStatus, type: :model do
  it 'is valid with all the field' do
    story = FactoryGirl.build(:story_status)
    expect(story).to be_valid
  end

  it 'should be invalid with no name' do
    story = FactoryGirl.build(:story_status, name: nil)
    story.valid?
    expect(story.errors[:name]).to include "can't be blank", "is too short (minimum is 3 characters)"
  end

  it 'should be invalid with less than 3 chars' do
    story = FactoryGirl.build(:story_status, name: 'a')
    story.valid?
    expect(story.errors[:name]).to include "is too short (minimum is 3 characters)"
  end

  it 'should be invalid with less more 100 chars' do
    story = FactoryGirl.build(:story_status, name: 'a'* 101)
    story.valid?
    expect(story.errors[:name]).to include "is too long (maximum is 100 characters)"
  end

  it 'should be able to add a story status to stories' do
    s = FactoryGirl.create(:story, title: 'sss')
    s1 = FactoryGirl.create(:story, title: 's1ss')
    ss = FactoryGirl.create(:story_status, name: 'backend')
    ss.stories << [s, s1]
    expect(ss.stories.count).to eq 2
  end
end
