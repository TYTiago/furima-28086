require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe 'ユーザー新規登録' do
    it "全ての条件を入力すると登録ができる" do
      user = create(:user)
      category = create(:category)
      item = build(:item, user_id: user[:id], category_id: category[:id])
      expect(item).to be_valid
    end
    it 'price:半角英数混合(全角数字のみ)' do
      @item.price = '１１１１１'
      @item.valid?
      expect(@item.errors.full_messages).to include ("Price is not a number")
    end
    it "titleが空だと登録できない" do
      @item.title = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Title can't be blank"
    end
    it "priceが空では登録できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it "date_delivery_id が空だと登録できない" do
      @item.date_delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Date delivery can't be blank"
    end
    it "descriptionが空では登録できない" do
      @item.description = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Description can't be blank"
    end
    it "category_idが空だと登録できない" do
      @item.category_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it "area_idが空では登録できない" do
      @item.area_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Area can't be blank"
    end
    it "delivery_idが空だと登録できない" do
      @item.delivery_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Delivery can't be blank"
    end
    it "status_idが空では登録できない" do
      @item.status_id = ""
      @item.valid?
      expect(@item.errors.full_messages).to include "Status can't be blank"
    end
    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
  end
end


