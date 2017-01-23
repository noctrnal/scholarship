class CreateEvaluations < ActiveRecord::Migration[5.0]
  def change
    create_table :evaluations do |t|
      t.references :submission, foreign_key: true
      t.integer :commitment
      t.integer :scholarship
      t.integer :recommendations
      t.integer :goals
      t.string :remarks
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
