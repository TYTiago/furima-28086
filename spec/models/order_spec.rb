require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    # binding.pry
    user = FactoryBot.create(:user)
    user_buy = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order = FactoryBot.build(:order, user_id: user_buy.id, item_id: item.id)
  end
  describe '購入機能' do
    it 'すべての値が正しく入力されていれば保存できること' do
      # binding.pry
      expect(@order).to be_valid
    end
    it "municipalityが空では登録できない" do
      @order.municipality = ""
      @order.valid?
      expect(@order.errors.full_messages).to include "Municipality can't be blank"
    end
    it "address が空だと登録できない" do
      @order.address = ""
      @order.valid?
      expect(@order.errors.full_messages).to include "Address can't be blank"
    end
    it "phone_numberが空だと登録できない" do
      @order.phone_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include "Phone number can't be blank"
    end
    it "prefecture_idが0だと登録できない" do
      @order.prefecture_id = 0
      @order.valid?
      expect(@order.errors.full_messages).to include "Prefecture must be other than 0"
    end
    it "phone_numberが空だと登録できない" do
      @order.phone_number = ""
      @order.valid?
      expect(@order.errors.full_messages).to include "Phone number can't be blank"
    end
    it "phone_numberが11桁以上だと登録できない" do
      @order.phone_number = 000000000000
      @order.valid?
      expect(@order.errors.full_messages).to include "Phone number is invalid"
    end
    it "phone_numberが11桁以下だと登録できない" do
      @order.phone_number = 0000000000
      @order.valid?
      expect(@order.errors.full_messages).to include "Phone number is invalid"
    end
    it "postalが空だと登録できない" do
      @order.postal = ""
      @order.valid?
      expect(@order.errors.full_messages).to include "Postal can't be blank"
    end
  
    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
end
end