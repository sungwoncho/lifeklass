Rails.application.routes.draw do
  root 'static_pages#home'
  devise_for :users

  mount Courses::Engine, at: '/', as: :courses_app
end
