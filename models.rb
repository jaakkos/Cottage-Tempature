MongoMapper.connection = Mongo::Connection.new(ENV['DB_HOST'], ENV['DB_PORT'])
MongoMapper.database = ENV['DB_NAME']
MongoMapper.database.authenticate(ENV['DB_USER'],ENV['DB_PASS'])

class Cottage
  include MongoMapper::Document
  key :name, String
  key :desc, String
  key :alert_temp, Float
  key :alert_emails, Array
  key :last_alert_send_at, Time
  key :alerts_disabled, Boolean
  key :api_key, String
  many :tempatures
end

class Tempature
  include MongoMapper::Document
  belongs_to :cottage
  key :temp, Float
  timestamps!
end
