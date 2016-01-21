Rails.application.routes.draw do
  get 'user_sessions/new'

  get 'user_sessions/create'

    get "/pages/:page" => "pages#show"
    root "pages#show", page: "home"
    resources :user
    resources :todo_lists do
        resources :todo_items do
            member do
                patch :complete
            end
        end
    end
    'todo_lists#index'
    resources :conversations do
        resources :messages
        end
    get 'about' =>'about_pages#about'
    get 'faq' =>'faq_pages#faq'
    end

#CalendarExample::Application.routes.draw do
  get 'user_sessions/new'

  get 'user_sessions/create'

#resources :calendar, only: [:show], controller: :calendar
#root to: "calendar#show"
#end

