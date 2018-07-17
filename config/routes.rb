Rails.application.routes.draw do
  devise_for :users
  root "pages#tasks_dashboard"
  get 'users', to: 'pages#user_list'
end
