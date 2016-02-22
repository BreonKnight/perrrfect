Rails.application.routes.draw do
    root to: "static_pages#home"
    resources :users, except: :edit
    get "/users/:id/edit", to: "users#edit", as: "edit_user"
    get "/login", to: "sessions#new"
    get "/logout", to: "sessions#destroy"
    get "/sessions", to: "sessions#create"

    resources :games
end
