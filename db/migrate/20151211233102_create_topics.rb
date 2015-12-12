class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.string :slug, null: false
      t.datetime :suggestions_start_at, null: false
      t.datetime :suggestions_end_at, null: false
      t.string :created_by, null: false

      t.timestamps null: false
    end

    add_index :topics, :name
    add_index :topics, :slug, unique: true
  end
end
