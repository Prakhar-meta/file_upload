class FileUpload < ApplicationRecord
  belongs_to :user
  has_attached_file :file
  validates_attachment_content_type :file, content_type: ['image/jpeg', 'image/png', 'application/pdf', 'application/zip', 'text/plain', 'application/zip']
  validates_attachment_size :file, less_than: 1.gigabyte

  before_create :generate_tiny_url

  private

  def generate_tiny_url
    self.tiny_url = SecureRandom.urlsafe_base64(6)
  end
end

