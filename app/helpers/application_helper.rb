module ApplicationHelper
  
  def localized_price(p)
    number_to_currency(p, :unit=>'€', :format=>'%n %u', :separator=>',')
  end
  
end
