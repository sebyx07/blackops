class AuthenticationController < ApplicationController
  def login
    login = UsersService::Login.new(params: params)
                               .process
    if login.user.present?
      set_session(login.user)
      head 200
    else
      head 404
    end
  end

  def set_session(user)
    session[:user_id] = user.id
  end
end