Courses::Engine.routes.draw do
  resources :courses do
    resources :menus, path: '' do
      resources :contents, path: '', except: :index
    end

    member do
      resource :enrollment, only: [:create, :destroy]
    end
  end
end
