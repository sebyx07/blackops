require 'filewatcher'

start_server = Proc.new do
  system('crystal build src/ws.cr')
  Kernel.fork do
    env = 'PG_URL=postgres://postgres:1234@localhost:5432/backend_dev'
    exec("#{env} ./ws")
  end
end

server = start_server.call

FileWatcher.new('src/').watch do |_f|
  puts server
  system("kill -9 #{server}")
  #sleep 1
  #server = start_server.call
end