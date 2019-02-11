FactoryBot.define do
  factory :user do
    name { 'testUser1' }
    email { 'example01@example.com' }
    password { '123abc#$' }
  end
end
