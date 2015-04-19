Courses::Engine.routes.draw do
  resources :courses do
    resources :contents
    member do
      resource :enrollment, only: [:create, :destroy]
    end
  end
end
