class AddCategoryForPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :category, :text
  end
end
