FactoryGirl.define do
  factory :sku do
    product
    warehouse
    sku {rand(1000..100000)}
  end
end
