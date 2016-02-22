Rails.application.routes.draw do
    root to: "static_pages#home"
    resources :users

    get "/login", to: "sessions#new"
end
