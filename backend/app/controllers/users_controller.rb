class UsersController < ApplicationController
  def heartbeat
    service = UsersService::Heartbeat.new(user: current_user).process
    render json: {time: service.user.last_seen}
  end
end