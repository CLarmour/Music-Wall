# Homepage (Root path)
get '/' do
  erb :index
end

get '/songs' do
  @songs = Song.order(created_at: :desc)
  erb :'songs/index'
end

get '/songs/new' do
  @song = Song.new
  erb :'songs/new'
end

get '/songs/:id' do
  @song = Song.find params[:id]
  @songs = Songs.where(artist: @songs.artist)
  erb :'songs/show'
end

post '/songs' do
  @song = Song.new(
    title: params[:title],
    artist: params[:artist],
    url: params[:url]
  )
  if @song.save
  redirect '/songs'
  else
    erb :'songs/new'
  end
end