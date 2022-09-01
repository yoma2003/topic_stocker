# ゲストユーザー削除
User.find_by!(email: 'guest@example.com').destroy


# ゲストユーザー作成
guest_user = User.create!(name: "ゲストユーザー", email:'guest@example.com', password: SecureRandom.urlsafe_base64)
guest_user_id = guest_user.id


# 人データ作成
characters_info = [
  {name: "ヨマさん", twitter_id: "yoma_2003", facebook_id: "", instagram_id: "", describe: "大阪市在住\r\n89年生まれ\r\nRuby、Ruby on Railsを中心に学習\r\nエンジニア転職活動中\r\n元薬剤師\r\n元バンドマン\r\n元ヒッチハイカー\r\n筋トレ好き"},
  {name: "イッシー", twitter_id: "yoma_2003", facebook_id: "", instagram_id: "", describe: "東京都在住\r\n87年生まれ\r\n元ファーマス\r\n薬剤師イベント主催\r\nサッカー好き"},
  {name: "高橋くん", twitter_id: "yoma_2003", facebook_id: "", instagram_id: "", describe: "大阪市在住\r\n93年生まれ\r\nファーマス\r\n名古屋出身\r\nバンド好き\r\n坂本店引き継ぎ\r\nペット：ルーシー"},
  {name: "田中さん", twitter_id: "", facebook_id: "", instagram_id: "", describe: "京都府在住\r\nファーマス\r\n人事採用担当（22年〜）"},
  {name: "ユウキさん", twitter_id: "yoma_2003", facebook_id: "", instagram_id: "", describe: "大阪府在住\r\n95年生まれ\r\nサウナ好き→ほぼ毎日行っている\r\nPHP、Laravel自己学習\r\nペット：ミミ"},
  {name: "三上さん", twitter_id: "yoma_2003", facebook_id: "", instagram_id: "", describe: "京都府在住\r\n株式会社ネックス（受託開発企業）（22.1〜）\r\nPHPフルスクラッチ自己学習\r\n前職製造業\r\nサキガケ勉強会"},
  {name: "堀さん", twitter_id: "", facebook_id: "", instagram_id: "", describe: "大阪市在住\r\n83年生まれ\r\nサキガケ勉強会\r\nスマホアプリ開発メイン"},
  {name: "橋下さん", twitter_id: "", facebook_id: "", instagram_id: "", describe: "大阪市在住\r\n74年生まれ\r\nファーマス\r\n尼崎店\r\nバンド、ボーカル活動"},
  {name: "斎藤さん", twitter_id: "", facebook_id: "", instagram_id: "", describe: "三重県在住\r\nメディカルボンド（卸）\r\n92年生まれ"},
  {name: "川本くん", twitter_id: "yoma_2003", facebook_id: "", instagram_id: "", describe: "徳島県在住\r\n93年生まれ\r\n元銀行員\r\nサウナ好き\r\nPython学習中"}
]
created_character_ids = []
characters_info.each do |character_info| # future_topicは1対1なのでここで登録したい。けど、imageがFormオブジェクト経由でアタッチできるか？
  character = Character.create!(
    name: character_info[:name],
    twitter_id: character_info[:twitter_id],
    facebook_id: character_info[:facebook_id],
    instagram_id: character_info[:instagram_id],
    describe: character_info[:describe],
    user_id: guest_user_id
  )
  created_character_ids << character.id
end


# カテゴリデータ作成
categories_info = [
  {name: "サキガケ勉強会", describe: "関西エンジニアコミュニティ"},
  {name: "株式会社ファーマス", describe: "調剤薬局事業"},
  {name: "ファーマス関連", describe: "ファーマス時代の社外繋がり"},
  {name: "TECH CAMP同期", describe: ""}
]
created_category_ids = []
categories_info.each do |category_info|
  category = Category.create!(
    name: category_info[:name],
    describe: category_info[:describe],
    user_id: guest_user_id
  )
  created_category_ids << category.id
end


# カテゴリと人の紐付け
character_categories_info = [
  {category_order: 1, character_orders: [1, 5, 6, 7]},
  {category_order: 2, character_orders: [2, 3, 4, 8]},
  {category_order: 3, character_orders: [9]},
  {category_order: 4, character_orders: [1, 10]}
]
character_categories_info.each do |character_category_info|
  character_category_info[:character_orders].each do |character_order|
    CharacterCategory.create!(category_id: created_category_ids[character_category_info[:category_order] - 1], character_id: created_character_ids[character_order - 1])
  end
end


# 未来話題の登録
future_topics_info = [
  {character_order: 1, furure_topic: "・転職活動の状況について"},
  {character_order: 2, furure_topic: "・新アプリの構想（コストについて）"},
  {character_order: 3, furure_topic: "・本山さんへの挨拶"},
  {character_order: 4, furure_topic: ""},
  {character_order: 5, furure_topic: "・転職活動状況について"},
  {character_order: 6, furure_topic: "・チーム開発の手法について"},
  {character_order: 7, furure_topic: "・ゲーム開発について\r\n・開発コスト管理について"},
  {character_order: 8, furure_topic: ""},
  {character_order: 9, furure_topic: ""},
  {character_order: 10, furure_topic: "・アルゴリズムの学習について"}
]
future_topics_info.each do |future_topic_info|
  FutureTopic.create!(character_id: created_character_ids[future_topic_info[:character_order] - 1], future_topic: future_topic_info[:future_topic])
end


# 過去話題の登録
past_topics_info = [
  {character_order: 1, topics: [
    {past_topic: "・話題管理アプリ（TopicStocker）\r\n→こだわり：JSの非同期処理\r\n→難点：AWSデプロイ\r\n・フリーランス薬剤師について", created_date: "2022-08-07"},
    {past_topic: "・Qiita記事について\r\n→JS関連\r\n・GitHubの草について", created_date: "2022-07-24"},
    {past_topic: "・サ活に目覚めた話\r\n・バンド活動時代の話\r\n→アメ村ライブ、CD販売\r\n・ヒッチハイク時代の話\r\n→電子書籍出版", created_date: "2022-07-03"}
  ]}, 
  {character_order: 2, topics: [
    {past_topic: "・名古屋ファーマスのMAの話\r\n・フリーランス薬剤師の話\r\n・1ヶ月大阪にいる", created_date: "2022-08-06"}
  ]}, 
  {character_order: 3, topics: [
    {past_topic: "・大阪でバンド活動していた\r\n→メロコア好き", created_date: "2022-06-30"},
    {past_topic: "・坂本店の現在の状況", created_date: "2022-08-06"}
  ]}, 
  {character_order: 4, topics: [
    {past_topic: "・入社説明会担当の話\r\n→佐藤くんと一緒に働いている\r\n・店舗責任者就任の話", created_date: "2022-08-06"}
  ]}, 
  {character_order: 5, topics: [
    {past_topic: "・温冷交代浴について", created_date: "2022-07-17"},
    {past_topic: "・おすすめサウナの話\r\n→八幡湯\r\n・就活中の企業の情報について\r\n→株式会社HEAVEN", created_date: "2022-07-24"}
  ]}, 
  {character_order: 6, topics: [
    {past_topic: "・Ajaxの話\r\n→フレームワークでなく生のコード学習", created_date: "2022-07-24"}
  ]}, 
  {character_order: 7, topics: [
    {past_topic: "・スマホアプリのフロントエンドの話\r\n・用語学習について\r\n→セキュリティ対策", created_date: "2022-07-24"}
  ]}, 
  {character_order: 8, topics: [
    {past_topic: "・ユキさん（元大学同期）海外移住の話\r\n・バースデーパーティー\r\n→10月20日", created_date: "2022-07-10"}
  ]}, 
  {character_order: 9, topics: [
    {past_topic: "・高橋クリニック院長の話\r\n→跡継ぎの話", created_date: ""}
  ]}, 
  {character_order: 10, topics: [
    {past_topic: "・ボードゲームについて\r\n→カタン\r\n・ギャグアニメについて", created_date: "2022-08-26"},
    {past_topic: "・転職活動状況について", created_date: "2022-08-06"}
  ]}, 
]
past_topics_info.each do |past_topic_info|
  past_topic_info[:topics].each do |topic|
    PastTopic.create!(character_id: created_character_ids[past_topic_info[:character_order] - 1], past_topic: topic[:past_topic], created_date: topic[:created_date])
  end
end


# イメージアタッチ処理（画像縮小）



# 10.times do |n| 

#   character = Character.new(
#     name: "テスト太郎#{n + 1}",
#     describe: "テスト用のキャラクターデータです",
#     user_id: 2,
#   )
#   character.image.attach(io: File.open("./app/assets/images/test_image#{n + 1}.jpeg"), filename: "test_image#{n + 1}.jpeg")  
#   character.future_topics.build(
#     future_topic: "テスト用のフューチャートピックです"
#   )
#   character.past_topics.build(
#     past_topic: "テスト用のパストトピックです",
#     created_date: "2022-07-01"
#   )
#   character.save
# end