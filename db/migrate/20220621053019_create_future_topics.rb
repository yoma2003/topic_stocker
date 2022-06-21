class CreateFutureTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :future_topics do |t|
      t.text :future_topic
      t.references :character, null: false, foreign_key: true

      t.timestamps
    end
  end
end
