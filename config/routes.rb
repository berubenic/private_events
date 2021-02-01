Rails.application.routes.draw do
  # resources :sessions, only: %i[new create delete]
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'sessions/create'
  get 'sessions/destroy'
  resources :users, only: %i[new create show]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
