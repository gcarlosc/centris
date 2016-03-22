class StockWarehousePdf < Prawn::Document
  def initialize(warehouses)
    super(top_margin: 100)
    @warehouses = warehouses
    image "#{Rails.root}/app/assets/images/logo_centris.jpg", :at => [400, 720], :scale => 0.25
    id
    warehouses_list

  end

  def id
    font "Courier" do
      text "Stock Por Almacenes", size: 20, style: :bold, align: :center
    end
  end

  def warehouses_list
    move_down 30
    @warehouses.map do |warehouse|
    data1 = [[warehouse.name.upcase]]
    table(data1, position: :center, column_widths: [450], row_colors: ["F0F0F0"])
      warehouse.products.map do |product|
       data2 = [[product.name.capitalize, Sku.filtered_skus(warehouse, product).by_statuses([0, 1]).size.to_s]]
       table(data2, position: :center, column_widths: [400, 50], row_colors: ["FFFFCC"])
      end
      move_down 20
    end
  end
end
