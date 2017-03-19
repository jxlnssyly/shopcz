class CreatePrivileges < ActiveRecord::Migration[5.0]
  def change
    create_table :privileges do |t|
      t.string :pri_name
      t.string :controller_name
      t.string :action_name
      t.integer :parent_id, default: 0
      t.integer :role_id, default: 0
      t.integer :level, default: 0

      t.timestamps
    end
  end
end
