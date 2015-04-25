Courses::Engine.routes.draw do
  resources :courses do
    resources :menus, path: '' do
      resources :contents, path: ''
    end

    member do
      resource :enrollment, only: [:create, :destroy]
    end
  end
end
