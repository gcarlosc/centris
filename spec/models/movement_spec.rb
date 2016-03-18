require 'rails_helper'

describe Movement, type: :model do
  describe '#change_warehouse' do
    it 'change skus warehouse_id' do
      product = create(:product)
      creator = create(:user, email: 'user1@example.com')
      responsable = create(:user, email: 'user2@example.com')
      originable = create(:warehouse)
      destinable = create(:warehouse)
      movement = create(:movement, creator_id: creator.id, responsable_id: responsable.id, movement_type_id: 2, originable_id: originable.id, originable_type: 'Supplier', destinable_id: destinable.id, destinable_type: 'Supplier')
      sku = create(:sku, warehouse_id: originable.id)
      movement.add_skus(sku.id)
      movement.change_warehouse
      expect(movement.skus.first.warehouse_id).to eq(movement.destinable_id)
    end
  end
end
