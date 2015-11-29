Rails.application.routes.draw do

  get 'posts' => 'posts#index'

  resources :posts, shallow: true do
    resources :comments do
      resources :likes
    end
  end

end
