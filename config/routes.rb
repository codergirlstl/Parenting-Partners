Rails.application.routes.draw do
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
    resources :conversations do
        resources :messages
        end
    get 'about' =>'about_pages#about'
    get 'faq' =>'faq_pages#faq'
    end

#CalendarExample::Application.routes.draw do
#resources :calendar, only: [:show], controller: :calendar
#root to: "calendar#show"
#end

