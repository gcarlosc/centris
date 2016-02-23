CategoryProduct.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('category_products')
CategoryProduct.create!([
  { name: 'Tecnologia' },
  { name: 'Utiles de Escritorio' },
  { name: 'Indumentaria' },
  { name: 'servidor', ancestry: 1 }
])

Unit.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('units')
Unit.create!([
  { name: 'Unidad' },
  { name: 'Millar' },
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

Organization.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('organizations')
Organization.create!([
  { name: 'Consumible', address: 'mi direccion 123', web: 'www.walkant.com' }
])
