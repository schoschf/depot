class StoreController < ApplicationController
  
  before_filter :count_hits, :only => [:index]
  
  def index
    @products = Product.all
  end


  private
  
  def count_hits
    if session[:store_index_hits].nil?
      session[:store_index_hits] = 0
    else
      session[:store_index_hits] += 1    
    end
  end
  
end
