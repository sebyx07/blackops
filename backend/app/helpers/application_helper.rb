module ApplicationHelper
  def current_user
    @current_user = User.find_by(id: session[:id])
  end

  def require_current_user
    if current_user.nil?
      head 404
    end
  end
end
