FactoryGirl.define do
  factory :flight do |f|
    f.from 1
    f.to 1
    f.departure "2016-03-17 08:45:07"
    f.arrival "2016-03-17 08:45:07"
    f.plane_id 1
  end

  factory :invalid_flight, parent: :flight do |f|
    f.from nil
    f.to nil
    f.departure "2016-03-17 08:45:07"
    f.arrival "2016-03-17 08:45:07"
    f.plane_id 1
  end
end
