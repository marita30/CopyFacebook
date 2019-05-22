Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :posts
  root 'posts#index'

  get "users/:id", to: "users#show", as: 'user'

  resources :posts do
    resources :likes
    resources :comments
  end


  unauthenticated do
   root :to => 'home#index'
end

authenticated do
  root :to => 'dashboard#index'
end

end
