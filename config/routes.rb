Rails.application.routes.draw do
  root 'static_pages#home'

  get '/about' => 'static_pages#about'

  mount Courses::Engine, at: '/', as: :course_app
  mount Mentors::Engine, at: '/', as: :mentor_app
  mount Users::Engine, at: '/', as: :user_app
end
