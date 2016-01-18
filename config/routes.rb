Rails.application.routes.draw do
  resources :users
    get "/pages/:page" => "pages#show"
    root "pages#show", page: "home"
    resources :todo_lists, :calendar
end

#CalendarExample::Application.routes.draw do
  resources :users
#resource :calendar, only: [:show], controller: :calendar
#root to: "calendar#show"
#end

