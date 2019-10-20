class ItemsController < ApplicationController

  before_action :set_category, only: [:new, :create]
  before_action :set_value, only: [:show, :pre_edit] 

  def index
    #4件category_id取得
    category_ids = CategoryItem.group(:category_id).order(count_category_id: :desc).limit(4).count(:category_id).keys
    #全てのitem(40個)
    @all_items = []
    @categories = []
    category_ids.each do |category_id|
      #各カテゴリのitem(10個ずつ)
      items = []
      #各カテゴリに対し、最新の10件をcategory_itemモデルから取得
      categoryItem = CategoryItem.where(category_id: category_id).order(created_at: :desc).limit(10)
        categoryItem.each do |cItem|
          #取得したレコードからitem_idを取得
          itemId = cItem.item_id
          item = Item.find(itemId)
          items << item
        end
        @all_items << items
        category = Category.find(category_id)
        @categories << category
    end
  end

  def show
  end

  def new
    @item = Item.new
    @item.category_items.build
    @image = @item.images.build
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def pre_edit
  end

  private
  def item_params
    params.require(:item).permit(:name, :detail, :state, :size, :delivery_fee, :delivery_method, :price, :delivery_date, :prefecture_id, category_items_attributes: [:id, :category_id], images_attributes: [:id, :image]).merge(saler_id: current_user.id)
  end

  def set_category
    @category = Category.where(ancestry: nil)
  end

  def set_value
    @item = Item.find(params[:id])
    @image = Image.where(item_id: params[:id])
    @saler = User.find(@item.saler_id)
    @category = @item.categories[0]
    @address = Address.find_by(user_id: @saler.id)
    @salers_item = Item.where(saler_id: @saler.id)
    @order_count = @salers_item.where.not(buyer_id: nil).count
  end

end