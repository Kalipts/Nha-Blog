class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :slug , index: { unique: true }
      t.text :subtitle
      t.text :body

      t.timestamps
    end
  end
end
