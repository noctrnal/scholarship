class AddAttachmentLicenseResumeExpenseToSubmissions < ActiveRecord::Migration
  def self.up
    change_table :submissions do |t|
      t.attachment :license
      t.attachment :resume
      t.attachment :expense
    end
  end

  def self.down
    remove_attachment :submissions, :license
    remove_attachment :submissions, :resume
    remove_attachment :submissions, :expense
  end
end
