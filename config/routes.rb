Rails.application.routes.draw do

  root to: "devise/sessions#new"

  get 'posts' => 'posts#index'

  devise_for :users

  resources :posts do
    resources :comments, :likes
  end

end
