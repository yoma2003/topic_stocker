class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string    :name,    null: false
      t.string    :url
      t.text      :describe
      t.reference :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
