class CategoryProduct < ActiveRecord::Base

  has_many :subcategories, class_name: 'CategoryProduct', foreign_key: 'ancestry'
  has_many :products

  validates :name, presence: true

  def self.with_parent(ancestry)
    where ancestry: ancestry
  end

  def self.categories
    with_parent nil
  end

  def self.children_of(*categories)
    where(ancestry: category_products)
  end

  def products_by_category(warehouse)
    suma = 0
    self.products.each do |product|
      suma += product.skus.where(warehouse_id: warehouse.id).count
    end
    suma
  end
end
