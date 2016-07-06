class CreateEmployments < ActiveRecord::Migration[5.0]
  def change
    create_table :employments do |t|
      t.references :submission, foreign_key: true
      t.string :employer
      t.string :title
      t.date :start
      t.date :end

      t.timestamps
    end
  end
end
