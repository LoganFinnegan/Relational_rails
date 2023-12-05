Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #"/customers" - what user sees in url aka end point of url
  # get - verb or request type
  # customers#index - customers controller # method index
  # verb "/endpoint", to: "controller#action(aka method)"
  get "/customers", to: "customers#index" #R
  get "/customers/new", to: "customers#new"#C
  post "/customers", to: "customers#create"#C
  get "/customers/:id", to: "customers#show"#R
  get "/customers/:id/edit", to: "customers#edit"#U
  patch "/customers/:id", to: "customers#update"#U

  get "customers/:id/orders", to: "customer_orders#index"
  get "customers/:id/orders/new", to: "customer_orders#new"
  post "customers/:id/orders", to: "customer_orders#create"

  get "/orders", to: "orders#index"
  get "/orders/:id", to: "orders#show" 

end
