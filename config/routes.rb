Rails.application.routes.draw do
  devise_for :users, path_names: { sign_in: "login", sign_out: "logout"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "events#index"

  namespace :api , format: 'json' do
    resources :events
  end

  namespace :admin do
    resources :events do
      resources :contents
    end
    resources :users
  end

  devise_scope :users do
    get 'logout' => 'devise/sessions#destroy'
  end
end
