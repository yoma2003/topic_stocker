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
      it 'twitter_idがなくても登録できる' do
        @character_topic.twitter_id = ""
        expect(@character_topic).to be_valid
      end
      it 'facebook_idがなくても登録できる' do
        @character_topic.facebook_id = ""
        expect(@character_topic).to be_valid
      end
      it 'instagram_idがなくても登録できる' do
        @character_topic.instagram_id = ""
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
      it 'category_idsがなくても登録できる' do
        @character_topic.category_ids = []
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
      it 'imageがJPEGまたはPNG形式以外の場合は登録できない' do
        @character_topic.image = fixture_file_upload('app/assets/images/g_logo.webp', 'image/webp')
        @character_topic.valid?
        expect(@character_topic.errors.full_messages).to include("Image は JPEG 形式または PNG 形式のみ選択してください")
      end
    end
  end 
end
