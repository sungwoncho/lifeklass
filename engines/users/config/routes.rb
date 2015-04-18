Users::Engine.routes.draw do
  devise_for :users, class_name: "Users::User",
                     controllers: { sessions:      "users/sessions",
                                    registrations: "users/registrations",
                                    passwords:     "users/passwords"}

  root 'static_pages#home'

  resources :users
end
