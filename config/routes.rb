
Rails.application.routes.draw do
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
    #'todo_lists#index'
    #get 'todo_item'=>'todo_lists#index'
    resources :conversations do
        resources :messages
        end
    get 'about' =>'about_pages#about'
    get 'faq' =>'faq_pages#faq'
    get 'login' =>'user_session#new'
    end

#resource :calendar, only: [:show], controller: :calendar
#root to: "calendar#show"

