Rails.application.routes.draw do
    get "/pages/:page" => "pages#show"
    root "pages#show", page: "home"
    resources :todo_lists
    resources :user
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

