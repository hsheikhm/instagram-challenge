Rails.application.routes.draw do

  root to: "posts#index"

  get 'posts' => 'posts#index'

  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'devise/sessions#new', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  resources :posts do
    resources :comments, :likes
  end

end
