Users::Engine.routes.draw do
  devise_for :users, class_name: "Users::User",
                     controllers: { sessions:      "devise/sessions",
                                    registrations: "devise/registrations",
                                    passwords:     "devise/passwords"}

  root 'static_pages#home'

  resources :users
end
