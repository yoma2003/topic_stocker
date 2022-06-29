class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name,     null: false
      t.text   :describe, null: false

      t.timestamps
    end
  end
end
