class CategoryProduct < ActiveRecord::Base

  has_many :subcategories, class_name: 'CategoryProduct', foreign_key: 'ancestry'
  has_many :products



  def self.with_parent(ancestry)
    where ancestry: ancestry
  end

  def self.categories
    with_parent nil
  end

  def self.children_of(*categories)
    where(ancestry: category_products)
  end

end
