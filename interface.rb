require_relative 'user.rb'
require_relative 'super_user.rb'


$users = []
sara = User.new("Sara","9999",10000)
joey = User.new("Joey","1234",100)

$users << sara
$users << joey

def start_up

	$users.each.to_s { |x| puts x}
	print "hello enter account name"
	puts ">"
	account_name = $stdin.gets.chomp

	if $users.include?(account_name)
		ask_for_pin(account_name)
	else
		puts "Sorry there is no user #{account_name}"
		start_up
	end

end

def ask_for_pin(account_name)
	puts "please enter pin"
	puts ">"
	account_pin = gets.chomp
	if account_pin == account_name.pin
		print "Hello #{account_name}"  
		user_account(account_name)
	else
		puts "wrong pin"
		ask_for_pin(account_name)
	end
end

def user_account(account_name)

	puts " what would you like to do?"
	puts """
	withdrawl
	deposit
	balance
	exit
	>
	"""
	command = $stdnin.gets.chomp

	if command == "withdrawl"
		withdrawl(account_name)
	elsif command == "deposit"
		depisit(account_name)
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
	account_name.withdrawl
end

def deposit(account_name)
	account_name.deposit
end

def balance(account_name)
	account_name.ammount
end

def exit
	start_up
end
 $users.instance_variable_get("@name")

# start_up

# puts $users.inspect.split(',')

