class User < ActiveRecord::Model
  adapter postgres
  primary id                 : String
  field username             : String
  field session              : String
end
