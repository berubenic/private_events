Rails.application.routes.draw do
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  get 'sessions/create'
  get 'sessions/destroy'
  resources :users, only: %i[create]
  match 'signup' => 'users#new', :via => :get
  resources :events, only: %i[index show new create]

  match 'send_invite' => 'users#send_invitation', :via => :post
  match 'accept_invite' => 'users#accept_invitation', :via => :post

  root 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
