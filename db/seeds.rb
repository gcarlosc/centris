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

MovementType.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('movement_types')
MovementType.create!([
  { name: 'externo', factor: '1' },
  { name: 'interno', factor: '-1' },
  { name: 'prestamo', factor: '-1' },
  { name: 'devolucion', factor: '-1' },
  { name: 'devexterna', factor: '-1' }
])

