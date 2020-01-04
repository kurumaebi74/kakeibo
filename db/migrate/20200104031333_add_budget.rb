class AddBudget < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :budget, :text
  end
end
