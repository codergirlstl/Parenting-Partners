Rails.application.routes.draw do
    get "/pages/:page" => "pages#show"
    root "pages#show", page: "home"
    resources :users
    resources :user_sessions, only: [:new, :create]
    resources :todo_lists do
        resources :todo_items do
            member do
                patch :complete
            end
        end
    end
    get 'todo_item'=>'todo_lists#index'
    resources :conversations do
        resources :messages
        end
    get 'about' =>'about_pages#about'
    get 'faq' =>'faq_pages#faq'
    get 'login' =>'user_session#new'
    end



