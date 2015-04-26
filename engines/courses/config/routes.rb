Courses::Engine.routes.draw do
  resources :courses, except: :show do
    get 'info' => 'courses#show', on: :member

    member do
      resource :enrollment, only: [:create, :destroy]
    end

    resources :menus, path: '' do
      resources :contents, path: '', except: :index
    end
  end
end
