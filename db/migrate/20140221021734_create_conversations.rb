class CreateConversations < ActiveRecord::Migration
  def change
    create_table :conversations do |t|
      t.string :title
      t.integer :owner_id
      t.integer :topic_id

      t.timestamps
    end
    add_index :conversations, :topic_id
  end
end
