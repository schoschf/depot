require 'test_helper'

class LineItemTest < ActiveSupport::TestCase
  
  test "add a not existing product to cart" do
    p = Product.create(:title    => "1234567890",
                          :description => "yyy",
                          :image_url   => "zzz.jpg",
                          :price => 59.90 )
    assert_difference('LineItem.count',+1) do
      Cart.new.add_product(p.id).save!
    end
  end
  
  test "add the same product twice to cart" do
    c = Cart.create
    
    assert_difference('LineItem.count') do
      2.times do
        li = c.add_product(products(:ruby).id)
        li.save!
      end
    end
    
  end
  
end
