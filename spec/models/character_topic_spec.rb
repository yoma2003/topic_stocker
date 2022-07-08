require 'rails_helper'

RSpec.describe CharacterTopic, type: :model do
  before do
    @character_topic = FactoryBot.build(:character_topic)
  end

  describe 'データ新規登録' do
    context '新規登録できる場合' do
      it '全ての値が存在すれば登録できる' do
        expect(@character_topic).to be_valid
      end
      it 'imageがなくても登録できる' do
        @character_topic.image = nil
        expect(@character_topic).to be_valid
      end
      it 'urlがなくても登録できる' do
        @character_topic.url = ""
        expect(@character_topic).to be_valid
      end
      it 'describeがなくても登録できる' do
        @character_topic.describe = ""
        expect(@character_topic).to be_valid
      end
      it 'future_topicがなくても登録できる' do
        @character_topic.future_topic = ""
        expect(@character_topic).to be_valid
      end
      it 'past_topicがなくても登録できる' do
        @character_topic.past_topic = ""
        expect(@character_topic).to be_valid
      end
      it 'created_dateがなくても登録できる' do
        @character_topic.created_date = ""
        expect(@character_topic).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it 'nameがなければ登録できない' do
        @character_topic.name = ""
        @character_topic.valid?
        expect(@character_topic.errors.full_messages).to include("Name can't be blank")
      end
      it 'user_idがないと登録できない' do
        @character_topic.user_id = ""
        @character_topic.valid?
        expect(@character_topic.errors.full_messages).to include("User can't be blank")
      end
    end
  end 
end
