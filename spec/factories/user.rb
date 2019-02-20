FactoryBot.define do
  factory :user do
    id { 1 }
    name { 'testUser1' }
    email { 'example01@example.com' }
    password { '123abc#$' }
    activated { true }
    created_at { '2019-01-11' }

    trait :invalid do
      name { nil }
    end
  end

  factory :inactive_user do
    id { 2 }
    name { 'testUser2' }
    email { 'example01@example.com' }
    password { '123abc#$' }
    activated { false }
    created_at { '2019-01-13' }
  end

  factory :user_params do
    name { 'testUser3' }
    email { 'example03@example.com' }
    password { '123abc#$' }
  end
end
