class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.integer :writer_id
      t.text :body
      t.string :title

      t.timestamps
    end
    add_index :articles, :writer_id
  end
end
