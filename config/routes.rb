Rails.application.routes.draw do
#  get 'static_pages/home'
#  get 'static_pages/help'
#  get 'static_pages/about'
#  get 'static_pages/contact'
#  get 'static_pages/help'
#  get  'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup', to: 'users#new'
#  get  'galleries/new'
  get  'galleries/new',        to: 'galleries#new',   via:'get'
  get  'galleries/show',       to: 'galleries#show'
  get  'galleries/create',     to: 'galleries#create'
  resources :users
  resources :galleries
end
