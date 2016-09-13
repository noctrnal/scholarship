class AddEmailToTranscripts < ActiveRecord::Migration[5.0]
  def change
    add_column :transcripts, :email, :string
  end
end
