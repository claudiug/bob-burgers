# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  team_id         :integer
#  password_digest :string
#

FactoryGirl.define do
  factory :user do
    name "bazme"
    email "foo@foo.com"
    password 'amazingpassword'
  end

end
