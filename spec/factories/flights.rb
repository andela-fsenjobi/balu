FactoryGirl.define do
  factory :flight do
    from
    to
    departure "2016-03-17 08:45:07"
    arrival "2016-03-17 08:45:07"
    plane

    trait :invalid do
      from nil
      to nil
    end
  end
end
