class SongsController < ApplicationController

	get '/songs/new' do 
		@genres = Genre.all
    	erb :'/songs/new'
  	end

  	get '/songs/:slug' do
		
		@song = Song.find_by_slug(params[:slug])
		
		erb :'/songs/show'
	end

	

	get '/songs' do
		@songs = Song.all
		
		erb :'/songs/index'
	end

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_by_name(params[:artist][:name])

    if @artist == nil
      @artist = Artist.create(params[:artist])
    end

    @artist.songs << @song

    @song.genre_ids = params[:genres]

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs' do
    # binding.pry

    @song = Song.update(params[:song][:id], params[:song])
    @artist = Artist.find_by_name(params[:artist][:name])

    if @artist == nil
      @artist = Artist.create(params[:artist])
    end

    @artist.songs << @song

    @song.genre_ids = params[:genres]


    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
	
 get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end




end
