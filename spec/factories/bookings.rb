FactoryGirl.define do
  factory :booking do
    flight
    user
    code "1QWE323ER"
  end

  trait :invalid do
    flight_id nil
  end
end
