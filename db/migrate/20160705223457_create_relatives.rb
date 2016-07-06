class CreateRelatives < ActiveRecord::Migration[5.0]
  def change
    create_table :relatives do |t|
      t.references :submission, foreign_key: true
      t.string :name
      t.string :relationship
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip

      t.timestamps
    end
  end
end
