Rails.application.routes.draw do
  resources :warehouses
  post 'warehouses/:id/increase', to: 'warehouses#inc'
  post 'warehouses/:id/decrease', to: 'warehouses#dec'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
