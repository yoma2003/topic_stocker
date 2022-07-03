10.times do |n| 
  character = Character.new(
    name: "テスト太郎#{n + 1}",
    describe: "テスト用のキャラクターデータです",
    user_id: 2,
  )
  character.image.attach(io: File.open("./app/assets/images/test_image#{n + 1}.jpeg"), filename: "test_image#{n + 1}.jpeg")  
  character.future_topics.build(
    future_topic: "テスト用のフューチャートピックです"
  )
  character.past_topics.build(
    past_topic: "テスト用のパストトピックです",
    created_date: "2022-07-01"
  )
  character.save
end