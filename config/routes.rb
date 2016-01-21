Rails.application.routes.draw do

  root to: "devise/sessions#new"

  get 'posts' => 'posts#index'

  # devise_for :users

  devise_scope :user do
    root to: "devise/sessions#new"
  end


  resources :posts do
    resources :comments, :likes
  end

end
