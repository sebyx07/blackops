class AuthenticationController < ApplicationController
  before_action :require_current_user, only: [:current]

  def login
    login = UsersService::Login.new(params: params)
                               .process
    if login.user.present?
      set_session(login.user.session)
      render_current_user(login.user)
    else
      head 404
    end
  end

  def logout
    cookies[:token] = nil
    head :ok
  end

    def current
    render_current_user(current_user)
  end

  def render_current_user(user)
    render json: user
  end

  def set_session(session)
    cookies.permanent[:token] = session
  end

  private :set_session, :render_current_user
end