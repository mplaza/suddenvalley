# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(:email => "someone@something.com", :password => "123455")
profile = Profile.create(:username => "pumpkin", :location=> "new jersey", :bio => "eh")

Topic.create(:user_id => user.id, :title => "mytopic", :content => "none")
Profile.create(:user_id => user.id)

Tag.create(:description => "neighborhoods")
Tag.create(:description => "discussing with others")
Tag.create(:description => "apartment complexes")
