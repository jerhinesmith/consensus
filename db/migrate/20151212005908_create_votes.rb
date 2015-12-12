class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :topic_id, null: false
      t.integer :suggestion_ids, null: false, array: true, default: []
      t.string :created_by, null: false

      t.timestamps null: false
    end

    add_index :votes, [:topic_id, :created_by], unique: true
    add_column :topics, :winning_suggestion_id, :integer
  end
end
