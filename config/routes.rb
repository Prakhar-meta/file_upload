Rails.application.routes.draw do
  devise_for :users
  resources :file_uploads, only: [:new, :create, :index, :destroy]

  # Custom route for shared files
  get '/files/:tiny_url', to: 'file_uploads#show', as: 'shared_file'

  # Set the root route to the sign-in page
  devise_scope :user do
    root to: 'devise/sessions#new'
  end
end


