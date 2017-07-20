module UsersService
  class Login < OpenStruct
    def process
      user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        self.user = user
      end
      self
    end
  end
end