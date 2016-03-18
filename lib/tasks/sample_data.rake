require 'ffaker'
require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :centris do

  desc 'Generate centris data'
  task sample_data: :environment do
    User.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('users')

    10.times do |i|
      User.create!(
        fullname: FFaker::NameMX.full_name,
        email: "cliente#{i+1}@example.com",
        phone: FFaker::PhoneNumber.short_phone_number,
        password_digest: 'password'
        )
    end

    puts "users created"

    CategoryProduct.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('category_products')

    5.times do
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
        code: "PROY_00#{i+1}",
        organization_id: 1
        )
    end

    puts "projects created"


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

    5.times do |i|
      Product.create!(
        name: FFaker::Product.product,
        unit_id: 1,
        category_product_id: i + 1,
        description_id: i + 1,
        classification_id: 3,
        code: "PROD_00#{i+1}"
        )
    end

    puts "products created"


    Supplier.destroy_all
    ActiveRecord::Base.connection.reset_pk_sequence!('suppliers')

    5.times do |i|
      Supplier.create!(
        name: FFaker::Company.name,
        address: FFaker::Address.street_address,
        contact_name: FFaker::NameMX.full_name,
        email: FFaker::Internet.safe_email,
        phone: FFaker::PhoneNumber.short_phone_number
        )
    end

    puts "suppliers created"


  Movement.destroy_all
  Sku.destroy_all
  Item.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!('movements')
  ActiveRecord::Base.connection.reset_pk_sequence!('skus')
  ActiveRecord::Base.connection.reset_pk_sequence!('items')

#Movimiento Externo 1 - Almacen 1
  Movement.create!(
    creator_id: 1,
    responsable_id: 2,
    movement_type_id: 1,
    originable_id: 1,
    originable_type: 'Supplier',
    destinable_id: 1,
    destinable_type: 'Warehouse',
    status: 1
    )

  #Skus
  10.times do |i|
    Sku.create!(
      sku: "ASD 00#{i+1}",
      product_id: 1,
      warehouse_id: 1,
      status: 0
      )
  end

  15.times do |i|
    Sku.create!(
      sku: "WER 00#{i+1}",
      product_id: 2,
      warehouse_id: 1,
      status: 0
      )
  end

#Items
  25.times do |i|
    Item.create!(
      sku_id: i+1,
      movement_id: 1
      )
  end

#Movimiento Externo 2 - Almacen 3
  Movement.create!(
    creator_id: 1,
    responsable_id: 5,
    movement_type_id: 1,
    originable_id: 3,
    originable_type: 'Supplier',
    destinable_id: 3,
    destinable_type: 'Warehouse',
    status: 1
    )

  20.times do |i|
    Sku.create!(
      sku: "VBN 00#{i+1}",
      product_id: 3,
      warehouse_id: 3,
      status: 0
      )
 end

#Items
  20.times do |i|
    Item.create!(
      sku_id: i+26,
      movement_id: 2
      )
  end

puts "movimiento externo created"



#Movimiento Interno - Transf. de Alamcen 1 a Almacen 2
  Movement.create!(
    creator_id: 1,
    responsable_id: 3,
    movement_type_id: 2,
    originable_id: 1,
    originable_type: 'Warehouse',
    destinable_id: 2,
    destinable_type: 'Warehouse',
    status: 1
    )

#update_skus
  Sku.where(id: 21).update_all(warehouse_id: 2)
  Sku.where(id: 22).update_all(warehouse_id: 2)
  Sku.where(id: 23).update_all(warehouse_id: 2)
  Sku.where(id: 24).update_all(warehouse_id: 2)
  Sku.where(id: 25).update_all(warehouse_id: 2)

#Items
    Item.create!(
      sku_id: 21,
      movement_id: 3
      )
    Item.create!(
      sku_id: 22,
      movement_id: 3
      )
    Item.create!(
      sku_id: 23,
      movement_id: 3
      )
    Item.create!(
      sku_id: 24,
      movement_id: 3
      )
    Item.create!(
      sku_id: 25,
      movement_id: 3
      )

puts "movimiento interno created"

#Prestamo
  Movement.create!(
    creator_id: 1,
    responsable_id: 5,
    movement_type_id: 3,
    originable_id: 3,
    originable_type: 'Warehouse',
    destinable_id: 3,
    destinable_type: 'Warehouse',
    status: 1
    )

  #update_skus
  Sku.where(id: 44).update_all(status: 1)
  Sku.where(id: 45).update_all(status: 1)

  #items
  Item.create!(
      sku_id: 44,
      movement_id: 4
      )

    Item.create!(
      sku_id: 45,
      movement_id: 4
      )

  puts "movimiento prestamo created"
  end
end
