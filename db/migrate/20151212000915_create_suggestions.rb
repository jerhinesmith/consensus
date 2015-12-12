class CreateSuggestions < ActiveRecord::Migration
  def change
    create_table :suggestions do |t|
      t.integer :topic_id, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :created_by, null: false

      t.timestamps null: false
    end

    add_index :suggestions, :topic_id
  end
end
