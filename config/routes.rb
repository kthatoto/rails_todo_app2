Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get    'signin',  to: 'devise/sessions#new'
    get    'signup',  to: 'devise/registrations#new'
    delete 'signout', to: 'devise/sessions#destroy'
  end
  root "pages#tasks_dashboard"
  get 'users', to: 'pages#user_list'
end
