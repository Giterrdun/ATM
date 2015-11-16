require 'gosu'
require_relative 'atm.rb'
require_relative 'user.rb'
require_relative 'super_user.rb'
require_relative 'z_order.rb'
require_relative 'text_fields.rb'















class  GameWindow < Gosu::Window

	def initialize
		super 640, 480
		self.caption = "ATM"

		 font = Gosu::Font.new(self, Gosu::default_font_name, 20)
	    
	    
	    @text_fields = Array.new(1) { |index| TextField.new(self, font, 300, 150 + index * 50) }
	    
	    @cursor = Gosu::Image.new(self, "media/Cursor.png", false)

		@atm = ATM.new
		$users << User.new("Sara","9999",10000)
		$users << User.new("Joey","1234",100)

	end



	def draw 
		@text_fields.each { |tf| tf.draw }
		@cursor.draw(mouse_x, mouse_y, 0)
		@atm.draw
	end

	def button_down(id)
		if id == Gosu::KbTab then

	      index = @text_fields.index(self.text_input) || -1
	      self.text_input = @text_fields[(index + 1) % @text_fields.size]
	    elsif id == Gosu::KbEscape then

	      if self.text_input then
	        self.text_input = nil
	      else
	        close
	      end
	    elsif id == Gosu::MsLeft then
	     
	      self.text_input = @text_fields.find { |tf| tf.under_point?(mouse_x, mouse_y) }
	  
	  	
	    end
	 end
end

window = GameWindow.new
window.show

# @atm.start_up

