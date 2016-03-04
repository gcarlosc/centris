ActiveRecord::Base.connection.tables.each do |t|
  ActiveRecord::Base.connection.reset_pk_sequence!(t)
end

Movement.destroy_all

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
  { name: 'Mi Organizacion', address: 'mi direccion 123', web: 'www.walkant.com' }
])

Project.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('projects')
Project.create!([
  { name: 'Proyecto 1', address: 'mi direccion 123', organization_id: 1 },
  { name: 'Proyecto 2', address: 'mi direccion 123', organization_id: 1 },
  { name: 'Proyecto 3', address: 'mi direccion 123', organization_id: 2 }
])

Warehouse.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('warehouses')
Warehouse.create!([
  { name: 'Almacen 1', address: 'mi direccion 123', location: 'locacion 1', project_id: 1 },
  { name: 'Almacen 2', address: 'mi direccion 123', location: 'locacion 2', project_id: 2 },
  { name: 'Almacen 3', address: 'mi direccion 123', location: 'locacion 3', project_id: 3 },
  { name: 'Almacen 4', address: 'mi direccion 123', location: 'locacion 3', project_id: 3 }
])

Supplier.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('suppliers')
Supplier.create!([
  { name: 'Pepito SAC', address: 'mi direccion 123' },
  { name: 'Tia Veneno SA', address: 'mi direccion 123' }
])

MovementType.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('movement_types')
MovementType.create!([
  { name: 'externo', factor: '1' },
  { name: 'interno', factor: '-1' },
  { name: 'prestamo', factor: '-1' },
  { name: 'devolucion', factor: '-1' },
  { name: 'devexterna', factor: '-1' }
])

