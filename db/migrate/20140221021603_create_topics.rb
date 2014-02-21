class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.text :title
      t.text :description
      t.text :url
      t.text :tag
      t.integer :user_id
      t.timestamps
    end
    add_index :topics, :user_id
  end
end
