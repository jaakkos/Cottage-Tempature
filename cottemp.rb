
get '/' do
  redirect '/cottages'
end

get '/cottages' do
  @cottages = Cottage.all
  haml :index  
end

get '/cottages/:id' do
  @cottage = Cottage.find(params[:id])
  haml :show
end

get '/cottages/:id/edit' do
  @cottage = Cottage.find(params[:id])
  haml :edit
end

put '/cottages/:id' do
  @cottage = Cottage.find(params[:id])
  params["cottage"]["alert_emails"] = params["cottage"]["alert_emails"].split(",")
  @cottage.update_attributes(params["cottage"])
  if @cottage.save
    redirect "/cottages/#{@cottage.id}"
  else
    haml :edit
  end
end

get '/cottages/new' do 
  haml :new
end

get '/log/:api_key/:temp' do
  @cottage = Cottage.find(:first, :conditions => {:api_key => params[:api_key]})
  tempature = params[:temp].tr(",",".")
  @tempature = Tempature.create(:temp => tempature.to_f)
  if @tempature.save
    @cottage.tempatures << @tempature
    if @tempature.temp <= @cottage.alert_temp
      Pony.mail(:to => @cottage.alert_emails.join(","),
                :from => ENV['MAIL_USER'],
                :subject => "#{@cottage.name} tempature is under #{@cottage.alert_temp}",
                :body => erb(:alert_email), 
                :via => :smtp, 
                :smtp => {
                :host => 'smtp.gmail.com',
                :tls  => 'true',
                :port => 587,
                :user => ENV['MAIL_USER'],
                :password => ENV['MAIL_PASS'],
                :auth => :plain,
                :domain => ENV['MAIL_DOMAIN'] 
                })
      @cottage.last_alert_send_at = Time.now
      @cottage.save
    end
  end
end
