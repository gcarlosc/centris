FactoryGirl.define do
  factory :user do
    fullname FFaker::Company.name
    # email FFaker::Internet.disposable_email
    password_digest 'password'
    phone '123123123'
  end
end
