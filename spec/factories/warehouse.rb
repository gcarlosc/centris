FactoryGirl.define do
  factory :warehouse do
    project
    name FFaker::Company.name
    location 'Keller 155, Lima, Perú'
    address 'Keller 155, Lima, Perú'
    longitude -76.9979424
    latitude -12.1186581
  end
end
