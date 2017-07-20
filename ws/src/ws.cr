require "kemal"

ws "/ws" do |socket|
  # Send welcome message to the client
  socket.send "Hello from Kemal!"

  # Handle incoming message and echo back to the client
  socket.on_message do |message|
    puts message
    socket.send "Echo back from server #{message}"
  end

  # Executes when the client is disconnected. You can do the cleaning up here.
  socket.on_close do
    puts "Closing socket"
  end
end

Kemal.config.port = 3300
Kemal.run
