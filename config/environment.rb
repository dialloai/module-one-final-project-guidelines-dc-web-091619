require 'bundler'
require 'rainbow'
Bundler.require

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: "db/development.sqlite"
) 
require_all 'app'

ActiveRecord::Base.logger = nil