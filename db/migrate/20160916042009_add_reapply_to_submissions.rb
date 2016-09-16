class AddReapplyToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_column :submissions, :reapply, :boolean
  end
end
