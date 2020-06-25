class SearchController < ApplicationController
  def search
  	@model = params["search"]["model"]
  	@content = params["search"]["content"]
  	@record = search_for(@model, @content)
  end

  private
  	def search_for(model, content)
  		if model == 'customer'
  			Customer.where('name LIKE ?', '%'+content+'%')
  		elsif model == 'product'
  			Product.where('name LIKE ?', '%'+content+'%')
  		end
  	end
end
