require 'rails_helper'

RSpec.describe Character, type: :model do
  before do
    @character = FactoryBot.build(:character)
  end
  describe 'データ新規登録' do
    context 'データが登録できる場合' do
      it '全て存在すれば登録できる' do
        expect(@character).to be_valid
      end
    end
    context 'データが登録できない' do
      it 'nameがなければ登録できない' do
        @character.name = ''
        @character.valid?
        expect(@character.errors.full_messages).to include("Name can't be blank")
      end
      it 'userが紐付いていなければ登録できない' do
        @character.user = nil
        @character.valid?
        expect(@character.errors.full_messages).to include('User must exist')
      end
    end
  end
end
