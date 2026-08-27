Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  # resources :empregados, only: [:index]

  get "empregados" => "empregados#index", as: "empregados"

  get "show/:id" => "empregados#show", as: "exibicao"

  get "empregados/download_file" => "empregadoinfodetails#download_file", as: :empregados_download_file

  get "empregados/:id" => "empregados#edit", as: "edit_empregado"

  patch "empregados/:id" => "empregados#update", as: "update_empregado"

  get "empregados/:id/delete" => "empregados#delete_empregado", as: "delete_empregado"

  delete "empregados/:id" => "empregados#destroy", as: "empregado"

  get "empregado/novo" => "empregados#new", as: "novo_empregado"

  post "empregados" => "empregados#create", as: "create_empregado"

  resources :users

  resources :unicoempregadodelete, only: [:index]
  delete "unicoempregadodelete/destroy_selected", to: "unicoempregadodelete#destroy_selected", as: :destroy_selected_unicoempregadodelete

  resources :bulkdeleteempregados, only: [:index] do
    delete "bulk_delete", on: :collection
  end

  resources :offshoreempregados, only: [:new, :create]

  get "locations/states", to: 'locations#states'
  get "locations/cities", to: 'locations#cities'

  get "shoppingcart/index", to: 'shoppingcart#index'
  get "shoppingcart/product_list", to: 'shoppingcart#product_list'
  get "shoppingcart/:product_id/add_cart", to: 'shoppingcart#add_cart', as: :add_cart

  get "shoppingcart/:cart_id/remove_cart", to: 'shoppingcart#remove_cart', as: :remove_cart

  resources :empregadospaginacoes, only: [:index]

  get 'radio_index', to: "allowances#radio_index"
  post 'radio_create', to: "allowances#radio_create"

  get 'check_box_index', to: "allowances#check_box_index"
  post 'check_box_create', to: "allowances#check_box_create"

  get 'list_box_index', to: "allowances#list_box_index"
  post 'list_box_create', to: "allowances#list_box_create"

  resources :empregadofiltros, only: [:index]

  resources :transfers, except: [:show, :edit, :update]

  resources :belfastempregados, only: [:index]

  get 'belfastempregados/export_as' => 'belfastempregados#export_as', as: :export_as

  resources :empregadoinfodetails, only: [:index, :show, :new, :create]
  root "empregadoinfodetails#index"
end
