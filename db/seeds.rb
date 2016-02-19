CategoryProduct.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('category_products')
CategoryProduct.create!([
{ name: 'Tecnologia' },
{ name: 'servidor', ancestry: 1 }
])
