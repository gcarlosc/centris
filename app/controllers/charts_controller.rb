class ChartsController < ApplicationController

  def index
    @categories = CategoryProduct.all
    @warehouses = Warehouse.all
  end

  def by_category
    category = CategoryProduct.find params[:cat]
    data_table = GoogleVisualr::DataTable.new
    # Add Column Headers
    data_table.new_column('string', 'Almacenes' )
    data_table.new_column('number', 'Skus')
    # Add Rows and Values
    Warehouse.all.each do |warehouse|
      data_table.add_rows([
        [warehouse.name, category.products_by_category(warehouse)]
      ])
    end
    opts   = { width: 1000, height: 300, title: 'Productos en Almacen por Categoria', vAxis: { title: 'Almacenes', titleTextStyle: { color: 'red' } }, hAxis: { title: 'Productos', titleTextStyle: { color: 'red' } }}
    @chart = GoogleVisualr::Interactive::BarChart.new(data_table, opts)
  end

  def by_warehouse
    warehouse = Warehouse.find params[:warehouse]
    data_table = GoogleVisualr::DataTable.new
    # Add Column Headers
    data_table.new_column('string', 'Almacenes' )
    data_table.new_column('number', 'Skus')
    # Add Rows and Values
    Product.all.each do |product|
      data_table.add_rows([
        [product.name, product.skus.where(warehouse_id: warehouse.id).count]
      ])
    end
    opts   = { width: 1000, height: 300, title: 'Productos Por Almacen', hAxis: { title: 'Productos', titleTextStyle: { color: 'red' } }}
    @chart = GoogleVisualr::Interactive::BarChart.new(data_table, opts)
  end
end
