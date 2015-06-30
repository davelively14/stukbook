# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "dlively", email: "dlively@niletradingco.com", password: "password", password_confirmation: "password")
User.create(username: "jsampson", email: "jsampson@niletradingco.com", password: "password", password_confirmation: "password")
User.create(username: "tswift", email: "tswift@niletradingco.com", password: "password", password_confirmation: "password")
User.create(username: "slively", email: "slively@niletradingco.com", password: "password", password_confirmation: "password")
User.create(username: "ewoolf", email: "ewoolf@niletradingco.com", password: "password", password_confirmation: "password")
p "Test users created"