Rails.application.routes.draw do
    get "/pages/:page" => "pages#show"
    root "pages#show", page: "home"
    resources :todo_lists
end

CalendarExample::Application.routes.draw do
    resource :calendar, only: [:show], controller: :calendar
    root to: "calendar#show"
end

