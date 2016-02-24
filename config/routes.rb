Rails.application.routes.draw do
    root to: "static_pages#home"
    resources :users, except: :edit
    get "/users/:id/edit", to: "users#edit", as: "edit_user"
    get "/login", to: "sessions#new"
    get "/logout", to: "sessions#destroy"
    post "/sessions", to: "sessions#create"
    patch "/games/:game_id/characters/:id", to: "characters#update", as: "patch"

    resources :games

    resources :games do
      resources :characters
    end

    resources :characters do
      resources :combos
    end
end
