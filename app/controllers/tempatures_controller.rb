class TempaturesController < ApplicationController
  
  use_google_charts
  
  def add
    @tempature = Tempature.create({:cottage_id => params[:cottage_id], 
        :temp => params[:temp].tr(',','.')})
  end

  def index
    dataset1 = GoogleChartDataset.new :data => 
      Tempature.find(:all).collect{|t| t.temp.to_f }.collect
    dataset2 = GoogleChartDataset.new :data => 
      Tempature.find(:all).collect{|t| t.created_at.strftime '%m/%d/%Y' }.collect
    data = GoogleChartData.new :datasets => dataset1
    axis = GoogleChartAxis.new :axis  => [GoogleChartAxis::LEFT]
    axis_labels = GoogleChartAxis.new :labels => dataset2
    @chart = GoogleLineChart.new :width => 500, :height => 200, :title => "Cottage Tempature"
    @chart.data = data
    @chart.axis = axis

  end

end
