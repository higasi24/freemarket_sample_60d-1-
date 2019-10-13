class ItemsController < ApplicationController
  before_action :set_address, :set_brand, :set_category, :set_user, :set_comment

  def index
  end

  def show
    @item = Item.find(params[:id])
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
    params.require(:item).permit(:name, :detail, :state, :size, :delivery_fee, :delivery_method, :price, :delivery_date, :area_id, category_items_attributes: [:id, :category_id], images_attributes: [:id, :image]).merge(saler_id: current_user.id)
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def set_category
    @category = Category.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

end
