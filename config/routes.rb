Forem::Engine.routes.append do
  resources :forums, :only=> [:index, :show] do
    member { get :search }
  end
end