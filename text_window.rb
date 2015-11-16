require 'gosu'
require_relative 'text_fields.rb'

class TextInputWindow < Gosu::Window
  def initialize
    super(300, 200, false)
    self.caption = "Text Input Example"
    
    font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    
    
    @text_fields = Array.new(3) { |index| TextField.new(self, font, 50, 30 + index * 50) }
    
    @cursor = Gosu::Image.new(self, "media/Cursor.png", false,100)
  end
  
  def draw
    @text_fields.each { |tf| tf.draw }
    @cursor.draw(mouse_x, mouse_y, 0)
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