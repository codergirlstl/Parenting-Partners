Rails.application.routes.draw do
  resources :meetings
    get "/pages/:page" => "pages#show"
    root "pages#show", page: "home"
    get "/login" => "user_sessions#new", as: :login
    delete "/logout" => "user_sessions#destroy", as: :logout
    
    resources :users
    resources :user_sessions, only: [:new, :create]
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :todo_lists do
        resources :todo_items do
            member do
                patch :complete
            end
        end
    end
    resources :contacts
    resources :calendars do
        resources :meetings
        end
    #resources :conversations do
    #resources :messages
    #end
end