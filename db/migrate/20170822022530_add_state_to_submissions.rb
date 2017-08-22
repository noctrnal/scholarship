class AddStateToSubmissions < ActiveRecord::Migration[5.0]
  def change
    add_reference :submissions, :state, foreign_key: true
  end
end
