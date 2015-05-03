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

require 'rails_helper'

RSpec.describe Story, type: :model do
  it 'is valid with all the field' do
    story = FactoryGirl.build(:story)
    expect(story).to be_valid
  end

  it 'is invalid with no title' do
    story = FactoryGirl.build(:story, title: nil)
    story.valid?
    expect(story.errors[:title]).to include "can't be blank"
  end

  it 'is valid with no description' do
    story = FactoryGirl.build(:story, description: nil)
    story.valid?
    expect(story).to be_valid
  end

  it 'is invalid with description greater than 1000 chars' do
    story = FactoryGirl.build(:story, description: 'a'* 1001)
    story.valid?
    expect(story.errors[:description]).to include "is too long (maximum is 1000 characters)"
  end

  it 'is valid with no hours' do
    story = FactoryGirl.build(:story, hours: nil)
    story.valid?
    expect(story).to be_valid
  end

  it 'is invalid with less than 3 chars for title' do
    story = FactoryGirl.build(:story, title: 'a')
    story.valid?
    expect(story.errors[:title]).to include "is too short (minimum is 3 characters)"
  end

  it 'is invalid with more than 100 chars to title' do
    story = FactoryGirl.build(:story, title: 'a'* 101)
    story.valid?
    expect(story.errors[:title]).to include "is too long (maximum is 100 characters)"
  end

  it 'is invalid with no proper integer formar for hours' do
    story = FactoryGirl.build(:story, hours: 'a')
    story.valid?
    expect(story.errors[:hours]).to include "is not a number"
  end

  it 'should be able to add a department to a story' do
    story = FactoryGirl.create(:story)
    d = FactoryGirl.create(:department, name: 'dep')
    story.department = d
    story.save
    expect(story.department).to_not be_nil
    expect(story.department.name).to eq 'dep'
  end

  it 'should be able to add a story status to a story' do
    story = FactoryGirl.create(:story)
    ss = FactoryGirl.create(:story_status, name: 'ready for develop')
    story.story_status = ss
    story.save
    expect(story.story_status.name).to eq ss.name
  end

end
