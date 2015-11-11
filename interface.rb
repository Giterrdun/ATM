require 'Gosu'
require_relative 'atm.rb'
require_relative 'user.rb'
require_relative 'super_user.rb'

atm = ATM.new()


$users << User.new("Sara","9999",10000)

$users << User.new("Joey","1234",100)






atm.start_up

