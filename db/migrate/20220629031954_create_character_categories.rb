class CreateCharacterCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :character_categories do |t|
      t.references :character, null: false, foreign_key: true
      t.references :category,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
