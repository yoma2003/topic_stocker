class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string    :name,  null: false
      t.string    :twitter_id
      t.string    :facebook_id
      t.string    :instagram_id
      t.text      :describe
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
