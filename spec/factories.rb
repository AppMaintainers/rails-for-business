FactoryGirl.define do
  factory :student do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    sequence(:nickname)  { |n| "nickname#{n}" }
    password "12345678"
  end

  factory :work do
  end

  factory :task do
    sequence(:description)  { |n| "Task #{n}" }
    points 3
  end
end
