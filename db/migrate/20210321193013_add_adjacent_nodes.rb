class AddAdjacentNodes < ActiveRecord::Migration[6.1]
  def change
    add_column :nodes, :adjacent_nodes, :integer, array: true, default: []

  end
end
