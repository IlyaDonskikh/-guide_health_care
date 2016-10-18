Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope module: :panel, as: :panel, path: :panel do
    root 'organizations#index'
    resources :organizations, except: :show
  end
end
