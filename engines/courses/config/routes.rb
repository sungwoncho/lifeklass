Courses::Engine.routes.draw do
  resources :courses do

    member do
      resource :enrollment, only: [:create, :destroy]
    end

    resources :menus, path: '' do
      resources :contents, path: '', except: :index
    end
  end

  resources :course_information, only: [:show, :edit, :update]
end
