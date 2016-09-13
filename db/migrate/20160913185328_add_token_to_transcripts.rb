class AddTokenToTranscripts < ActiveRecord::Migration[5.0]
  def change
    add_column :transcripts, :token, :string
  end
end
