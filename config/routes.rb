Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :artworks, only: [:create, :destroy, :show, :update] do
    members do
      post :like, to: 'artworks#like', as: 'like'
      post :unlike, to: 'artworks#unlike', as: 'unlike'
      post :favorite, to: 'artworks#favorite', as: 'favorite'
      post :unfavorite, to: 'artworks#unfavorite', as: 'unfavorite'
    end
  end

  resources :artwork_shares, only: [:create, :destroy] do
    members do
      post :favorite, to: 'artwork_shares#favorite', as: 'favorite'
      post :unfavorite, to: 'artwork_shares#unfavorite', as: 'unfavorite'
    end
  end

  resources :comments, only: [:create, :destroy, :index] do
    post :like, to: 'comments#like', as: 'like'
    post :unlike, to: 'comments#unlike', as: 'unlike'
  end
  
  resources :users, only: [:create, :destroy, :index, :show, :update] do
    resources :artworks, only: [:index]
  end

  # The lines below are the full paths for all the routes the controller does
  # fully contained in resources :user (above).

  # get "/users", to: "users#index", as: "users"
  # post "/users", to: "users#create"
  # get "/users/new", to: "users#new", as: "new_user"
  # get "/users/:id/edit", to: "users#edit", as: "edit_user"
  # get "/users/:id", to: "users#show", as: "user"
  # patch "/users/:id", to: "users#update"
  # put "/users/:id", to: "users#update"
  # delete "/users/:id", to: "users#destroy"
end
