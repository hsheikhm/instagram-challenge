Rails.application.routes.draw do

  devise_for :users
  root to: "posts#index"

  get 'posts' => 'posts#index'

  resources :posts do
    resources :comments, :likes
  end

end
