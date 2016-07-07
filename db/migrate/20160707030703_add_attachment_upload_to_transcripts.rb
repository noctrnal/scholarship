class AddAttachmentUploadToTranscripts < ActiveRecord::Migration
  def self.up
    change_table :transcripts do |t|
      t.attachment :upload
    end
  end

  def self.down
    remove_attachment :transcripts, :upload
  end
end
