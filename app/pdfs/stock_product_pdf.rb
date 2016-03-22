class StockProductPdf < Prawn::Document
  def initialize(products)
    super(top_margin: 100)
    @products = products
    image "#{Rails.root}/app/assets/images/logo_centris.jpg", :at => [400, 720], :scale => 0.25
    id
    products_list

  end

  def id
    font "Courier" do
      text "Stock Por Productos", size: 20, style: :bold, align: :center
    end
  end

  def products_list
    move_down 30
    @products.map do |product|
    data1 = [[product.name.upcase]]
    table(data1, position: :center, column_widths: [450], row_colors: ["F0F0F0"])
      product.warehouses.map do |warehouse|
       data2 = [[warehouse.name.capitalize, Sku.filtered_skus(warehouse, product).by_statuses([0, 1]).size.to_s]]
       table(data2, position: :center, column_widths: [400, 50], row_colors: ["FFFFCC"])
      end
      move_down 20
    end
  end
end
