class Server
  property server : WsServer
  property name : String

  def initialize(name)
    @name = name
    @server = WsServer.where({"name" => name})[0] ||
       WsServer.create({"name" => name, "family" => "chat"})
  end

  def register_to_db
    server.online = true
    server.connections = 0
    server.update
  end

  def listen
    ws "/ws/#{@name}" do |socket, ctx|
      socket.on_close do
        puts "Closing socket on #{@name}"
        unless server.nil?
          server.connections -= 1
          server.update
        end
      end

      if server
        @server.connections += 1
        @server.update
      end

      # Handle incoming message and echo back to the client
      socket.on_message do |message|
        puts message
      end
    end
  end

  def start
    puts "Starting #{@name}"
    register_to_db
    listen
  end
end
