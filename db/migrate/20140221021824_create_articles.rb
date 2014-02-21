class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :title
      t.text :description
      t.text :url
      t.integer :topic_id

      t.timestamps
    end
    add_index :articles, :topic_id
  end
end
