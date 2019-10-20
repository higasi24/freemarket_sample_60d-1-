require 'rails_helper'

user = FactoryBot.create(:user)

RSpec.describe Item, type: :model do
  describe '#create' do
    context 'can save' do
      it 'is valid with item' do #Itemが存在していたら出品できる
        item = build(:item, saler_id: user.id)
        expect(item).to be_valid
      end
      # it 'is valid without item' do #Itemのnameがnilでも出品できる
      #   item = build(:item, name: nil, saler_id: user.id)
      #   item.valid?
      #   binding.pry
      #   expect(item.errors[:name]).to include("can’t be blank")
      # end
      # it 'priceが300円以下でvalid' do
      #   item = build(:item, price: 200, saler_id: user.id)
      #   item.valid?
      #   expect(item.errors[:price]).to include("can’t be blank")
      # end
      # it 'priceが9,999,999円以上ででvalid' do
      #   item = build(:item, price: 10000000, saler_id: user.id)
      #   item.valid?
      #   expect(item.errors[:price]).to include("can’t be blank")
      # end
    end
  end
end