class AddAttachmentFileToFileUploads < ActiveRecord::Migration[5.1]
  def change
    add_column :file_uploads, :file_file_name, :string
    add_column :file_uploads, :file_content_type, :string
    add_column :file_uploads, :file_file_size, :integer
    add_column :file_uploads, :file_updated_at, :datetime
  end
end
