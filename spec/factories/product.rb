FactoryGirl.define do
  factory :product do
    name FFaker::Product.product
    category_product_id { rand(1..3) }
    classification_id { rand(1..3) }
    description_id { rand(1..3) }
    unit_id 1
    code {rand(1000..100000)}
  end
end
