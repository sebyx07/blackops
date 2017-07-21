class Server < ActiveRecord::Model
  adapter postgres
  table_name "ws_servers"
  primary id                 : Int
  field name                 : String
  field family               : String
  field connections          : Int
  field online               : Bool
end
