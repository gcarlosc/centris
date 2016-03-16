require 'ffaker'
require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :centris do

  desc 'Generate centris data'
  task create_users: :environment do
    User.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('users')

    2.times do |i|
      User.create!(
        fullname: FFaker::NameMX.full_name,
        email: "cliente#{i+1}@example.com",
        phone: FFaker::PhoneNumber.short_phone_number,
        password_digest: 'password'
        )
    end

    puts "users created"
  end

  desc 'Generate centris data'
  task data: :environment do

    CategoryProduct.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('category_products')

    3.times do
      CategoryProduct.create!(
        name: FFaker::Product.product_name,
        )
    end

    puts "category_products created"


    Project.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('projects')

    5.times do |i|
      Project.create!(
        name: "Proyecto #{i + 1}",
        address: FFaker::Address.street_address,
        code: FFaker::Currency.code,
        organization_id: 1
        )
    end

    puts "projects created"


    Description.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('descriptions')

    5.times do
      Description.create!(
        brand: FFaker::Product.brand,
        sub_brand: FFaker::Product.model
        )
    end

    puts "descriptions created"


    Product.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('products')

    3.times do |i|
      Product.create!(
        name: FFaker::Company.name,
        unit_id: 1,
        category_product_id: i + 1,
        description_id: i + 1,
        classification_id: 3,
        code: FFaker::Currency.code
        )
    end

    puts "products created"


    Warehouse.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('warehouses')

    5.times do |i|
      Warehouse.create!(
        name: "Almacen #{i + 1}",
        address: FFaker::Address.street_address,
        location: FFaker::Address.street_address,
        project_id: i + 1
        )
    end

    puts "warehouses created"


    Supplier.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('suppliers')

    3.times do |i|
      Supplier.create!(
        name: FFaker::Company.name,
        address: FFaker::Address.street_address,
        contact_name: FFaker::NameMX.full_name,
        email: FFaker::Internet.safe_email,
        phone: FFaker::PhoneNumber.short_phone_number
        )
    end

    puts "suppliers created"
  end
end
