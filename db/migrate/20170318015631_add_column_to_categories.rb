class AddColumnToCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :categories, :level, :integer
  end
end
