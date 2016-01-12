Rails.application.routes.draw do
    get "/pages/:page" => "pages#show"
    root "pages#show", page: "home"
    resources :todo_lists
end

    #get 'welcome/index'

#
  #end

  #get 'calendar/show'
  #get 'welcome/index'


  



  # You can have the root of your site routed with "root"
    #root 'welcome#index'

