# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html
puts 'CREATING ROLES'
Role.create([
	{ :name => 'admin' }, 
	{ :name => 'student' }, 
	{ :name => 'teacher' },
	{ :name => 'TA' },
	{ :name => 'designer' }
	], :without_protection => true)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Administrator', :email => 'admin@admin.com', :password => 'Admin123$', :password_confirmation => 'Admin123$', :provider=>"admin"
puts 'User created: ' << user.name

user.add_role :admin
