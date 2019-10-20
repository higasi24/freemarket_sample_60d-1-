FactoryBot.define do
  factory :item do
    name { "名前" }
    detail { "主催者の名前" }
    state { "参加条件" }
    size { "参加条件" }
    delivery_fee { "参加条件" }
    delivery_method { "参加条件" }
    price { 1000 }
    delivery_date { "参加条件" }
    prefecture_id { 1 }
    saler_id { 1 }
    
    # image {File.open("#{Rails.root}/public/images/test_image.jpg")}
    # category_items_attributes
    # images_attributes

    # name, :detail, :state, :size, :delivery_fee, :delivery_method, :price, :delivery_date, :prefecture_id, category_items_attributes: [:id, :category_id], images_attributes: [:id, :image]).merge(saler_id)
    
  end
end