require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    user = FactoryBot.create(:user)
    user_buy = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    @order = FactoryBot.build(:order, user_id: user_buy.id, item_id: item.id)
  end
  describe '購入機能' do
    it 'すべての値が正しく入力されていれば保存できること' do
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
    it "phone_numberに数値以外の文字列が含まれていると登録できない" do
      @order.phone_number = "あああaaaaaa"
      @order.valid?
      expect(@order.errors.full_messages).to include "Phone number is invalid"
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
    it "postalにハイフンを含まないと登録できない" do
      @order.postal = 0000000
      @order.valid?
      expect(@order.errors.full_messages).to include "Postal is invalid"
    end
    it "tokenが空では登録できないこと" do
      @order.token = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Token can't be blank")
    end
    it "postalにハイフンを含まないと登録できない" do
      @order.postal = 0000000
      @order.valid?
      expect(@order.errors.full_messages).to include "Postal is invalid"
    end
    it "建物名は空でも登録できる" do
      @order.building = ""
      expect(@order).to be_valid
    end
    it "user_idが空では登録できないこと" do
      @order.user_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("User can't be blank")
    end
    it "item_idが空では登録できないこと" do
      @order.item_id = nil
      @order.valid?
      expect(@order.errors.full_messages).to include("Item can't be blank")
    end
end
end