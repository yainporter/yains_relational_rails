Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/", to: "welcome#index"

  get "/families", to: "families#index", as: :families
  get "/families/new", to: "families#new", as: :families_new
  post "/families", to: "families#create", as: :families_create
  patch "/families/:id", to: "families#update", as: :families_update
  get "/families/:id", to: "families#show", as: :families_show
  get "/families/:id/edit", to: "families#edit", as: :families_edit
  delete "/families/:id", to: "families#destroy", as: :families_delete

  get "/families/:id/descendents", to: "family/descendents#index", as: :family_descendents
  get "/families/:id/descendents/new", to: "descendents#new", as: :family_descendents_new
  post "/families/:id/descendents", to: "descendents#create", as: :family_descendents_create

  get "/descendents", to: "descendents#index", as: :descendents
  get "/descendents/:id", to: "descendents#show", as: :descendents_show
  get "/descendents/:id/edit", to: "descendents#edit", as: :descendents_edit
  patch "/descendents/:id", to: "descendents#update", as: :descendents_update
  delete "/descendents/:id", to: "descendents#destroy", as: :descendents_delete
end
