FactoryGirl.define do
  factory :project do
    name FFaker::Company.name
    address 'Keller 155, Lima, Perú'
    code {rand(1000..100000)}
  end
end
