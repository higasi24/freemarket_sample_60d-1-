class CategoriesController < ApplicationController
  def index
    
  end
  def show
    @category = Category.find(params[:id])
    @categories = CategoryItem.where(category_id: @category.subtree_ids).map{|t| t.item_id}
    @items = Item.where(id: @categories).order(created_at: :desc)
  end
end
