Rails.application.routes.draw do
    root to: "static_pages#home"
    resources :users, except: :edit
    get "/users/:id/edit", to: "users#edit", as: "edit_user"
    get "/login", to: "sessions#new"
    get "/logout", to: "sessions#destroy"
    post "/sessions", to: "sessions#create"

    resources :games
    resources :characters
    resources :games do
      resources :characters
    end
end
