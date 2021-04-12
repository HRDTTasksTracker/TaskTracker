class CreateNodes < ActiveRecord::Migration[6.1]
  def change
    create_table :nodes do |t|
      t.string "task_name"
      #add_column :nodes, :adjacent_nodes, :integer, array: true, default: []

      t.timestamps
    end
  end
end



