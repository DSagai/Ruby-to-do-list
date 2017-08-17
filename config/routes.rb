Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #get 'lists' => "lists#index", as: "all_lists"
  root to: "lists#index"
  resources :lists do
    resources :tasks
  end
end
