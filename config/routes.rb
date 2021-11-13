Rails.application.routes.draw do

#  get  'dbpaths/show/:id',    to: 'dbpaths#show',    as: :galleries_show
  resources :dbpaths

   get 'mafft/align'
  post 'mafft/alignout'

  get  'blast/search', to: 'blast#search'
  post 'blast/blastout' => "blast/blastout"

  root 'static_pages#home'
  get  '/home',    to: 'static_pages#home'
  get  '/search',  to: 'static_pages#search'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup', to: 'users#new'
  resources :users

  get  'galleries/new/:id',    to: 'galleries#new',    as: :galleries_new
  get  'galleries/show/:id',        to: 'galleries#show' 

  get   'galleries/edit/:id',  to: 'galleries#edit' 
  patch 'galleries/edit/:id',  to: 'galleries#update' 

  get  'galleries/viewer/:id', to: 'galleries#viewer', as: :galleries_viewer
  get  'galleries/create',     to: 'galleries#create'
  get  'galleries/catalog',    to: 'galleries#catalog'

#  resources :galleries, only: [;create, :new, :edit, :update]
  resources :galleries

end

