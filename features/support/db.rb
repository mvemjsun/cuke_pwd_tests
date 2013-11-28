require 'database_cleaner'

DatabaseCleaner.strategy = :truncation

ActiveSupport::Inflector.inflections do |inflect|
  inflect.irregular 'session', 'session'
  inflect.irregular 'session_data', 'session_data'
  inflect.irregular 'securitylog', 'securitylog'
  inflect.irregular 'passwordattemptlog', 'passwordattemptlog'
end

ActiveRecord::Base.establish_connection(
				:adapter => "mysql2",
				:host => "dv-dep-1",
				:database => "motcomp" ,
				:username => "root",
				:password => "root123"
)
#ActiveRecord::Base.establish_connection(
#    :adapter => "mysql2",
#    :host => "localhost",
#    :database => "motcomp" ,
#    :username => "root",
#    :password => ""
#)
Before() do
	DatabaseCleaner.clean
end
