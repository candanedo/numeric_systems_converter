Rails.application.routes.draw do
  get 'decimal', to: 'pages#decimal'
  get 'binary', to: 'pages#binary'
  get 'octal', to: 'pages#octal'
  get 'hexadecimal', to: 'pages#hexadecimal'
  devise_for :users
  resources :numbers
  

  get 'welcome/index'
  root to: 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
