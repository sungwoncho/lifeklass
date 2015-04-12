Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users

  get '/about' => 'static_pages#about'

  mount Courses::Engine, at: '/', as: :courses_app
end
