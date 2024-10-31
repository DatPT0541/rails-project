class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :hash_id, unique: true

      t.timestamps
    end

    add_index :articles, :hash_id, unique: true
  end
end
