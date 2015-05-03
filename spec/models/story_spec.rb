# == Schema Information
#
# Table name: stories
#
#  id            :integer          not null, primary key
#  title         :string
#  description   :string
#  hours         :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  department_id :integer
#

require 'rails_helper'

RSpec.describe Story, type: :model do
  it 'is valid with all the field' do
    story = FactoryGirl.build(:story)
    expect(story).to be_valid
  end

  it 'is invalid with no name' do

  end

  it 'is valid with no description' do

  end

  it 'is invalid with description greater than 1000 chars' do

  end

  it 'is valid with no hours' do

  end

  it 'is invalid with no proper integer formar for hours' do

  end

end
