require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての値が存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'uid、providerがなくても登録できる' do
        @user.uid = ''
        @user.provider = ''
        expect(@user).to be_valid
      end
      it 'imageがなくても登録できる' do
        @user.image = nil
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nameがなければ登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailがなければ登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がなければ登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it '重複したemailが存在すると登録できない' do
        @user.save
        @user2 = FactoryBot.build(:user, email: @user.email)
        @user2.valid?
        expect(@user2.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordがなければ登録できない' do
        @user.password = @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordとpassword confirmationが一致なければ登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = @user.password_confirmation = '0' * 129
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too long (maximum is 128 characters)')
      end
    end
  end
end
