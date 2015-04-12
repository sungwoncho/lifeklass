module LoginMacro
  def login_user
    user = User.new
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  def logout_user
    allow(controller).to receive(:current_user).and_return(nil)
    allow(controller).to receive(:authenticate_user!).and_return(false)
  end

  def login_mentor
    mentor = Mentors::Mentor.new
    user = User.new

    allow(controller).to receive(:current_mentor).and_return(mentor)
    allow(controller).to receive(:current_user).and_return(user)
    allow(controller).to receive(:authenticate_user!).and_return(true)
  end

  def logout_mentor
    allow(controller).to receive(:current_mentor).and_return(nil)
    allow(controller).to receive(:current_user).and_return(nil)
    allow(controller).to receive(:authenticate_user!).and_return(false)
  end
end
