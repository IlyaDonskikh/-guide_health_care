Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :panel, as: :panel, path: :panel do
    root 'organizations#index'
    resources :organizations, except: :show
    resources :illnesses, except: :show
  end

  root 'organizations#index'
  resources :organizations, only: [:index, :show]
  resources :select_places, only: [:new, :create]
end
