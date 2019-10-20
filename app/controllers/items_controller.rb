class ItemsController < ApplicationController

  before_action :set_category, only: [:new, :create]
  before_action :set_value, only: [:show, :pre_edit] 

  def index

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




# itemを出品して値確認しながらやる！！！！！！！！！！！！


    # # 人気カテゴリの category_id 4つ取得(親要素内)
    # @category_ids = Items.group(:category_id).order(count_category_id: :desc).count(:category_id).limit(4).keys
    # # 人気ブランドの brand_id 4つ取得(注意:親要素はカテゴリーのため子要素取得)
    # @brand_ids = Items.group(:bland_id).order(count_brand_id: :desc).count(:bland_id).limit(4).keys

    # # 配列を入れる配列
    # # 40個ずつitem入ってる
    # @all_category_items = []
    # @all_brand_items = []

    # @category_ids.each do |category_id|
    #   # 取得したcategory_id4つそれぞれの中から最新のitem 10こを並べる
    #   @category_items = Items.where(category_id: category_id).order(created_at: :desc).limit(10) 
    #   @all_category_items << @category_items
    # end

    # @brand_ids.each do |brand_id|
    #   # 取得したbrand_id4つの中から最新のitem 10こを並べる
    #   @brand_items = Items.where(bland_id: brand_id).order(created_at: :desc).limit(10)
    #   @all_brand_items << @brand_items
    # end

    # # おそらく@all_category_items,@all_brand_itemsをeachでビューで表示すれば出力可能