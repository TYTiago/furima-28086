require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    it "重複したemailが存在する場合登録できない" do
      @user = create(:user)
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'password:半角英数混合(半角英語のみ)' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
    end
    it 'email:@がない' do
      @user.email = 'testsample'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email is invalid")
    end
    it 'first_name:半角英数混合(半角英語のみ)' do
      @user.first_name = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name is invalid")
    end
    it ' last_name:半角英数混合(半角英語のみ)' do
      @user.last_name = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name is invalid")
    end
    it 'first_name_kana:漢字ひらがなのみ' do
      @user.first_name_kana = 'あ亜'
      @user.valid?
      expect(@user.errors.full_messages).to include ("First name kana is invalid")
    end
    it ' last_name_kana:漢字ひらがなのみ' do
      @user.last_name_kana = 'あ亜'
      @user.valid?
      expect(@user.errors.full_messages).to include ("Last name kana is invalid")
    end
    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it "first_nameが空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it "last_nameが空だと登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it "first_name_kanaが空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it "last_name_kanaが空だと登録できない" do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it "birth_dateが空だと登録できない" do
      @user.birth_date = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birth date can't be blank"
    end
  end
end