class CreateVolunteers < ActiveRecord::Migration[5.0]
  def change
    create_table :volunteers do |t|
      t.references :submission, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
