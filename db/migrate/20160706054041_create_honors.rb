class CreateHonors < ActiveRecord::Migration[5.0]
  def change
    create_table :honors do |t|
      t.references :submission, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
