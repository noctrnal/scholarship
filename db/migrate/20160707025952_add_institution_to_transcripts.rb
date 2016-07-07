class AddInstitutionToTranscripts < ActiveRecord::Migration[5.0]
  def change
    add_reference :transcripts, :institution, foreign_key: true
  end
end
