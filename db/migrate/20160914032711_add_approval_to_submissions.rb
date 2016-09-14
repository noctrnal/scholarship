class AddApprovalToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :approval, :boolean
  end
end
