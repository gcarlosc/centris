CategoryProduct.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('category_products')
CategoryProduct.create!([
{ name: 'Tecnologia' },
{ name: 'servidor', ancestry: 1 }
])

Unit.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('units')
Unit.create!([
{ name: 'Kilometros' },
{ name: 'Metros' },
{ name: 'Kilogramos' },
{ name: 'Gramos' },
{ name: 'Meses' },
{ name: 'Semanas' },
{ name: 'Dias' },
{ name: 'Horas' }
])

Classification.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('classifications')
Classification.create!([
{ name: 'Consumible' },
{ name: 'Servicio' },
{ name: 'Almacenable' }
])
