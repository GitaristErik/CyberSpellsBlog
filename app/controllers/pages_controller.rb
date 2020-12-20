class PagesController < ApplicationController
  def about
      @heading = 'Про нас'
      @text = 'Трохи тексту про нас'
  end
end
