class CreateTranscripts < ActiveRecord::Migration[5.0]
  def change
    create_table :transcripts do |t|

      t.timestamps
    end
  end
end
