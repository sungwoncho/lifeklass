Courses::Engine.routes.draw do
  resources :courses do
    member do
      resource :enrollment, only: [:create, :destroy]
    end
  end
end
