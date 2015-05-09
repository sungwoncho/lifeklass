Courses::Engine.routes.draw do
  get 'courses/:id/edit' => 'courses#edit', as: :edit_course

  resources :courses, except: :edit do
    member do
      resource :enrollment, only: [:create, :destroy]
    end

    resources :menus, path: '', except: :index do
      get 'menu' => 'menus#index', on: :collection
      resources :contents, except: :index do
        resources :comments, only: [:new, :create, :update, :destroy]
      end
    end
  end

  resources :course_information, only: [:show]
end
