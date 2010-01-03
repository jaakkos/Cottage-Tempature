class TempaturesController < ApplicationController
  def add
    @tempature = Tempature.create({:cottage_id => params[:cottage_id], 
        :temp => params[:temp].tr(',','.')})
  end

  def index
    
  end

end
