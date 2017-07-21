module UsersService
  class Login < OpenStruct
    def process
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        self.user = user
      end
      user.session = SecureRandom.urlsafe_base64(180)
      user.save
      self
    end
  end
end