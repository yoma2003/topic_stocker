require 'rails_helper'

RSpec.describe Category, type: :model do
  before do
    @category = FactoryBot.build(:category)
  end
  
  describe 'カテゴリ新規登録' do
    context '新規登録できる場合' do
      it '全ての値が存在すれば登録できる' do
        expect(@category).to be_valid
      end
      it 'describeがなくても登録できる' do
        @category.describe = ''
        expect(@category).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nameがなければ登録できない' do
        @category.name = ''
        @category.valid?
        expect(@category.errors.full_messages).to include("Name can't be blank")
      end
      it 'userが紐付いていなければ登録できない' do
        @category.user = nil
        @category.valid?
        expect(@category.errors.full_messages).to include("User must exist")
      end
    end
  end
end
