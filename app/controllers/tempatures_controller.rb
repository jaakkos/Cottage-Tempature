class TempaturesController < ApplicationController
  
  use_google_charts
  
  def add
    @tempature = Tempature.create({:cottage_id => params[:cottage_id], 
        :temp => params[:temp].tr(',','.')})
  end

  def index
    puts Tempature.find(:all).each{|t| t.temp.to_f}.collect
    dataset = GoogleChartDataset.new :data => Tempature.find(:all).collect{|t| t.temp.to_f }.collect
    data = GoogleChartData.new :datasets => dataset
    @chart = GoogleLineChart.new :width => 300, :height => 200
    @chart.data = data
  end

end
