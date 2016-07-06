class CreateInstitutions < ActiveRecord::Migration[5.0]
  def change
    create_table :institutions do |t|
      t.references :submission, foreign_key: true
      t.string :name
      t.date :start
      t.date :end
      t.string :degree
      t.float :gpa

      t.timestamps
    end
  end
end
