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

  factory :user2, class: User do
    id { 2 }
    name { 'testUser2' }
    email { 'example02@example.com' }
    password { '123abc#$' }
    activated { true }
    created_at { '2019-01-11' }

    trait :invalid do
      name { nil }
    end
  end

  factory :admin, class: User do
    id { 3 }
    name { admin }
    email { 'admin@example.com' }
    password { '123abc#$' }
    activated { true }
    created_at { '2019-02-20' }

    admin { true }
  end
end
