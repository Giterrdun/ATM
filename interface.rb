require 'gosu'
require_relative 'atm.rb'
require_relative 'user.rb'
require_relative 'super_user.rb'
require_relative 'z_order.rb'














class  GameWindow < Gosu::Window

def initialize
	super 640, 480
	self.caption = "ATM"

	@atm = ATM.new
	$users << User.new("Sara","9999",10000)
	$users << User.new("Joey","1234",100)

end



def draw 
 @atm.draw
end

def button_down(id)
		close if id == Gosu::KbEscape
end

end

window = GameWindow.new
window.show

# @atm.start_up

