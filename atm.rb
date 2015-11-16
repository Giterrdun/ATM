require 'gosu'
require 'rubygems'
require_relative 'atm.rb'
require_relative 'user.rb'
require_relative 'super_user.rb'
require_relative 'z_order.rb'
require_relative 'text_fields.rb'
require_relative 'text_window.rb'
class  ATM


attr_accessor :users 

def initialize
	$users = []
	@font = Gosu::Font.new(20)
	

end

	def start_up	
	print "hello enter account name"
	puts ">"
	account_name = $stdin.gets.chomp
	$users.each { |users| 
		if users.name == (account_name)
		ask_for_pin(account_name)
		end
	}
	puts "Sorry there is no user #{account_name}"
	start_up
	end

def ask_for_pin(account_name)
	puts "please enter pin"
	puts ">"
	account_pin = gets.chomp
	$users.each { |users|
	if users.pin == account_pin && users.name == account_name
		print "Hello #{account_name}"  
		user_account(account_name)
	end
  }
  puts "wrong pin"
	ask_for_pin(account_name)
end

def user_account(account_name)

	puts " what would you like to make?"
	puts """
	withdrawl?

	deposit?

	balance?

	exit?
	>
	"""
	command = gets.chomp

	if command == "withdrawl"
		withdrawl(account_name)
	elsif command == "deposit"
		deposit(account_name)
	elsif command == "balance"
		balance(account_name)
	elsif command == "exit"
		exit
	else
		puts "Sorry I don't know what that is"
		user_account(account_name)
	end
end

def withdrawl(account_name)
	$users.each {|users|
		if users.name == (account_name)
	    users.withdrawl
	  end
	}
	user_account(account_name)
end

def deposit(account_name)
	$users.each {|users|
		if users.name == (account_name)
	    users.deposit
	  end
	}
	user_account(account_name)
end

def balance(account_name)
	$users.each {|users|
		if users.name == (account_name)
	    users.balance
	  end
	}
	user_account(account_name)
end

def exit
	start_up
end

def draw
	start_up
	user_name_phase
	
	
end

def user_name_phase
	
	
	@font.draw('Username >', 200, 150, ZOrder::UI, 1.0, 1.0, 0xff_70AF00)
	
	
end


end