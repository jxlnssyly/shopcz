class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :cat_name
      t.integer :parent_id, default: 0

      t.timestamps
    end
  end
end
