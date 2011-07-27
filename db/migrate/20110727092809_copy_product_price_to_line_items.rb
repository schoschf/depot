class CopyProductPriceToLineItems < ActiveRecord::Migration
  def self.up
    LineItem.where('product_id IS NOT NULL').each do |li|
      p li.inspect
      product = Product.find_by_id(li.product_id)
      p product.inspect
      li.product_price = product.price
      li.save!
    end
  end

  def self.down
    LineItem.update_all(:product_price => nil)
  end
end
