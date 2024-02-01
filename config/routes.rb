Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get "/families", to: "families#index", as: :families
  get "/families/new", to: "families#new", as: :families_new
  post "families/create", to: "families#create", as: :families_create
  get "/families/:id", to: "families#show", as: :families_show
  get "/families/:id/descendents", to: "family_descendents#index", as: :family_descendents

  get "/descendents", to: "descendents#index", as: :descendents
  get "/descendents/:id", to: "descendents#show", as: :descendents_show


end
