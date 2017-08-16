class AddMaidenToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :maiden_name, :string
  end
end
