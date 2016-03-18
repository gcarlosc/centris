FactoryGirl.define do
  factory :supplier do
    name FFaker::Company.name
    address FFaker::Address.street_address
    contact_name FFaker::NameMX.full_name
    email FFaker::Internet.disposable_email
    phone '123123123'
  end
end
