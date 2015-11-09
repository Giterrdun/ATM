class User

attr_accessor :name, :pin, :ammount

def initialize(name,pin,ammount)
	@name = name
	@pin = pin
	@ammount = ammount	
end

def ammount
	@ammount
end

def pin
	@pin
end

def deposit
puts "How much would you like to deposit?"
puts ">"
deposited = $stdin.gets.chomp.to_f
@ammount = @ammount + deposited
puts "your new balance is #{@ammount}"
end

def withdrawl
	puts "How much would you like to witdraw?"
	puts ">"
	withdraw = $stdin.gets.chomp.to_f
	if withdraw > @ammount
		withdraw = @ammount
	else
		@ammount = @ammount - withdraw
	end
	puts "your new balance is #{@ammmount}"
end




end