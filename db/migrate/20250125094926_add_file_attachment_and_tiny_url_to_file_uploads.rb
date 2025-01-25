class AddFileAttachmentAndTinyUrlToFileUploads < ActiveRecord::Migration[5.1]
  def change
    add_column :file_uploads, :tiny_url, :string
    add_column :file_uploads, :file, :attachment
  end
end
