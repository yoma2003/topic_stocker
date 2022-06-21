class CreatePastTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :past_topics do |t|
      t.text       :past_topic
      t.date       :created_date, null: false
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
