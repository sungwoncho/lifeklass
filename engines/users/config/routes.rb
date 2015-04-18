Users::Engine.routes.draw do
  devise_for :users, class_name: "Users::User",
                     controllers: { sessions:      "devise/sessions",
                                    registrations: "devise/registrations",
                                    passwords:     "devise/passwords"}

  resources :users
end
