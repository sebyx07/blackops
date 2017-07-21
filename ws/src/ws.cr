require "active_record"
require "postgres_adapter"
require "kemal"
require "sentry-run"
require "./ws/*"

server = Server.where({"name" => "chat#1"})[0]
if server.nil?
  server = Server.create({"name" => "chat#1", "family" => "chat"})
end
server.online = true
server.connections = 0
server.update
puts "start"

ws "/ws" do |socket, ctx|
  socket.on_close do
    puts "Closing socket"
    server.connections -= 1
    server.update
  end

  token = ctx.request.cookies["token"]?
  if token.nil?
    socket.close
    next
  end
  token_value = token.value
  user = User.where({"session" => token_value})[0]?
  if user.nil?
    socket.close
    next
  end

  if server
    server.connections += 1
    server.update
  end

  # Handle incoming message and echo back to the client
  socket.on_message do |message|
    puts socket
    puts message
    socket.send "Echo back from server #{message}"
  end
end

Kemal.config.port = 3300

Kemal.run
