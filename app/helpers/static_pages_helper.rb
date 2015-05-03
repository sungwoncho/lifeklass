module StaticPagesHelper
  def join_button
    link_to 'Join the movement', user_app.new_user_registration_path, class: 'btn btn-success' unless current_user
  end
end
