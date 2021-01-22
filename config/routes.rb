Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      devise_scope :user do
        post 'sign_in', to: 'sessions#create'
        post 'sign_up', to: 'registrations#create'
      end

      resources :assets, only: [:index, :create, :update, :destroy]
    end
  end
end
