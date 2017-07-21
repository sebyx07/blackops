module UsersService
  class Heartbeat < OpenStruct
    def process
      user.last_seen = Time.zone.now
      user.save
      self
    end
  end
end