class ItemsController < ApplicationController

  def index
  end

  def show
    @item = Item.find(params[:id])
    @address = Address.find(params[:id])
    @brand = Brand.find(params[:id])
    @category = Category.find(params[:id])
    @user = User.find(params[:id])
    @comment = Comment.find(params[:id])
  end

  def new
    @item = Item.new
    @item.category_items.build
    @item.images.build
  end

  def create
    @item = Item.new(item_params)
    @images = Image.new

    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end


  def update
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :detail, :state, :size, :delivery_fee, :delivery_method, :price, :delivery_date, :prefecture_id, category_items_attributes: [:id, :category_id], images_attributes: [:id, :image]).merge(saler_id: current_user.id)
  end

end
