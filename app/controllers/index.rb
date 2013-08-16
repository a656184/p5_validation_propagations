get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  erb :new_event
#TODO IMPLEMENT ME
end

post '/events/create' do
  @event = Event.new(params[:event])
  if @event.save
    redirect '/'
  else
    @errors = @event.errors
    erb :new_event
  end
  #TODO IMPLEMENT ME
end
