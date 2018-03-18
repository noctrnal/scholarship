class AddRootToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :root, :boolean
  end
end
