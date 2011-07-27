class AddProductPriceToLineItems < ActiveRecord::Migration
  def self.up
    add_column :line_items, :product_price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :line_items, :product_price
  end
end
