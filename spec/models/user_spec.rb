require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it 'nicknameが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上で英数混同で存在すれば登録できる' do
        @user.password = 'a00000'
        @user.password_confirmation = 'a00000'
        expect(@user).to be_valid
      end
      it 'last_nameが全角(漢字,ひらがな,カタカナ)で存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameが全角(漢字,ひらがな,カタカナ)で存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'last_name_initialsがカタカナで存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_name_initialsがカタカナで存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'birthdateが存在すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できないとき' do
      it "nicknameが空では登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Email can't be blank")
      end
      it "重複したemailが存在する場合は登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include ("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password confirmation doesn't match Password")
      end
      it "passwordが5文字以下では登録できない" do
        @user.password ='00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is too short (minimum is 6 characters)")
      end
      it "passwordが英数混同でなければ登録できない" do
        @user.password ='000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Password is invalid")
      end
      it "last_nameが空では登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name can't be blank")
      end
      it "first_nameが空では登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name can't be blank")
      end
      it "last_nameが全角(漢字,ひらがな,カタカナ)でないと登録できない" do
        @user.last_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name is invalid")
      end
      it "first_nameが全角(漢字,ひらがな,カタカナ)でないと登録できない" do
        @user.first_name = 'a'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name is invalid")
      end
      it "last_name_initialsが空では登録できない" do
        @user.last_name_initials = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name initials can't be blank")
      end 
      it "first_name_initialsが空では登録できない" do
        @user.first_name_initials = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name initials can't be blank")
      end
      it "last_name_initialsがカタカナでなければ登録できない" do
        @user.last_name_initials ='a'
        @user.valid?
        expect(@user.errors.full_messages).to include ("Last name initials is invalid")
      end
      it "first_name_initialsがカタカナでなければ登録できない" do
        @user.first_name_initials ='a'
        @user.valid?
        expect(@user.errors.full_messages).to include ("First name initials is invalid")
      end
      it "birthdateが空では登録できない" do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include ("Birth date can't be blank")
      end
    end
  end 
end
