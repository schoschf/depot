class CombineItemsInCart < ActiveRecord::Migration
  
  
  def self.up
    # replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      # count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)
      # something like "#<OrderedHash {2=>3, 3=>7, 4=>2}>"
      sums.each do |product_id, quantity|
        if quantity > 1
          # remove individual items
          cart.line_items.where(:product_id=>product_id).delete_all
          # replace with a single item
         cart.line_items.create(:product_id=>product_id, :quantity=>quantity)
        end
      end
    end
  end
  
  def self.down
   
    ## Algorithm coming from Book 
    # split items with quantity>1 into multiple items
    LineItem.where("quantity>1").each do |line_item|
      # add individual items
      line_item.quantity.times do
        LineItem.create :cart_id=>line_item.cart_id, :product_id=>line_item.product_id, :quantity=>1
      end
      # remove original item
      #line_item.destroy # book version
      line_item.delete # vollhorst's version
    end
    
  end  
  
end
