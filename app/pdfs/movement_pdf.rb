class MovementPdf < Prawn::Document
  def initialize(movement)
    super(top_margin: 100)
    @movement = movement
    image "#{Rails.root}/app/assets/images/logo_centris.jpg", :at => [400, 720], :scale => 0.25
    id
    header
    skus
  end

  def id
    font "Courier" do
      text "Guía de Movimiento n° #{@movement.id}", size: 20, style: :bold, align: :center
    end
  end

  def header
    draw_text "Creado por: #{@movement.creator.fullname}", size: 12, at: [20, 600]
    draw_text "Responsable: #{User.find(@movement.responsable_id).fullname.capitalize}", size: 12, at: [20, 570]
    draw_text "Tipo: #{@movement.movement_type.name}", size: 12, at: [20, 540]
    draw_text "Fecha de Creacion: #{@movement.created_at.to_date}", size: 12, at: [280, 600]
    if @movement.movement_type_id == 1
      draw_text "Origen: #{Supplier.find(@movement.originable_id).name.capitalize}", size: 12, at: [280, 570]
    else
      draw_text "Origen: #{Warehouse.find(@movement.originable_id).name.capitalize}", size: 12, at: [280, 570]
    end
    if @movement.movement_type_id == 5
      draw_text "Destino: #{Supplier.find(@movement.destinable_id).name.capitalize}", size: 12, at: [280, 540]
    else
      draw_text "Destino: #{Warehouse.find(@movement.destinable_id).name.capitalize}", size: 12, at: [280, 540]
    end
  end

  def skus
    move_down 130
    table skus_rows, position: :center, column_widths: [180, 100, 100, 120] do
      row(0).font_style = :bold
      columns(1..3).align = :center
      self.row_colors = ["F0F0F0", "FFFFFF"]
      self.header = true
    end
  end

  def skus_rows
    [["Producto", "Marca", "Modelo", "Sku"]] +
    @movement.skus.map do |sku|
      [sku.product.name, sku.product.description.brand, sku.product.description.sub_brand, sku.sku]
    end
  end
end
