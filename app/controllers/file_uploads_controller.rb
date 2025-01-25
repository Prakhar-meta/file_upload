class FileUploadsController < ApplicationController
  before_action :authenticate_user!

  def new
    @file_upload = current_user.file_uploads.build
  end

  def create
    @file_upload = current_user.file_uploads.build(file_upload_params)
    if @file_upload.save
      redirect_to file_uploads_path, notice: 'File uploaded successfully.'
    else
      render :new
    end
  end

  def index
    @file_uploads = current_user.file_uploads
  end

  def destroy
    @file_upload = current_user.file_uploads.find(params[:id])
    @file_upload.destroy
    redirect_to file_uploads_path, notice: 'File deleted successfully.'
  end

  def show
    @file_upload = FileUpload.find_by(tiny_url: params[:tiny_url])
    send_file @file_upload.file.path, type: @file_upload.file.content_type, disposition: 'inline'
  end
  

  private

  def file_upload_params
    params.require(:file_upload).permit(:title, :description, :file)
  end
end
